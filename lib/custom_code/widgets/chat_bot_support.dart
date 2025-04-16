// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter_sound/flutter_sound.dart';

class ChatBotSupport extends StatefulWidget {
  const ChatBotSupport({
    super.key,
    this.width,
    this.height,
    this.chatInput,
    required this.userUuid,
    required this.webhook,
    this.chatImage,
    this.chatAudio,
  });

  final double? width;
  final double? height;
  final String? chatInput;
  final String userUuid;
  final String webhook;
  final String? chatImage;
  final String? chatAudio;

  @override
  State<ChatBotSupport> createState() => _ChatBotSupportState();
}

class _ChatBotSupportState extends State<ChatBotSupport>
    with TickerProviderStateMixin {
  // Controlador para o campo de texto
  final TextEditingController _textController = TextEditingController();

  // Lista de mensagens
  List<ChatMessage> _messages = [];

  // Indicador de carregamento
  bool _isLoading = false;

  // ID da conversa atual
  String? _chatId;

  // Status de gravação de áudio
  bool _isRecording = false;

  // Timestamp para tempo de gravação
  DateTime? _recordingStartTime;

  // Controle de reprodução de áudio
  bool _isPlayingAudio = false;
  String? _currentAudioPlaying;

  // Timer para atualizar a UI durante gravação
  Timer? _recordingTimer;
  int _recordingDuration = 0; // em segundos

  // Remover a instância de Record e usar FlutterSoundRecorder
  final _audioRecorder = FlutterSoundRecorder();
  bool _isRecorderInitialized = false;
  String? _audioPath;
  String? _errorMessage;
  bool _isTranscribing = false;

  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _initializeChat();

    // Usar o chatInput inicial, se fornecido
    if (widget.chatInput != null && widget.chatInput!.isNotEmpty) {
      _textController.text = widget.chatInput!;
    }

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _initRecorder();
  }

  Future<void> _initRecorder() async {
    try {
      await _audioRecorder.openRecorder();
      _isRecorderInitialized = true;
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao inicializar gravador: $e';
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _recordingTimer?.cancel();
    _pulseController.dispose();

    // Fechar o gravador se estiver inicializado
    if (_isRecorderInitialized) {
      _audioRecorder.closeRecorder();
    }

    super.dispose();
  }

  // Inicializa o chat chamando a API webhook
  Future<void> _initializeChat() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Verificar se já existe uma conversa para este usuário
      final existingChat = await SupaFlow.client
          .from('chat_support')
          .select()
          .eq('chat_id', widget.userUuid)
          .maybeSingle();

      if (existingChat != null) {
        // Se existir, carregar as mensagens existentes
        _chatId = existingChat['chat_id'] as String;
        await _loadExistingMessages();
      } else {
        // Se não existir, criar uma nova conversa
        await _startNewConversation();
      }
    } catch (e) {
      _showError('Erro ao inicializar o chat: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Carregar mensagens existentes do Supabase
  Future<void> _loadExistingMessages() async {
    try {
      final messages = await SupaFlow.client
          .from('chat_messages')
          .select()
          .eq('chat_id', _chatId as Object)
          .order('sent_at', ascending: true);

      setState(() {
        _messages = messages
            .map<ChatMessage>((msg) => ChatMessage(
                  text: msg['message_type'] == 'text'
                      ? msg['content'] as String?
                      : null,
                  imageUrl: msg['message_type'] == 'image'
                      ? msg['content'] as String?
                      : null,
                  audioUrl: msg['message_type'] == 'audio'
                      ? msg['content'] as String?
                      : null,
                  isFromBot: msg['sent_by_bot'] as bool,
                  audioDuration: msg['message_type'] == 'audio' ? 15 : null,
                ))
            .toList();
      });
    } catch (e) {
      _showError('Erro ao carregar mensagens: $e');
    }
  }

  // Iniciar uma nova conversa
  Future<void> _startNewConversation() async {
    try {
      // Chamar a API webhook para iniciar a conversa
      final response = await http.post(
        Uri.parse(widget.webhook),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
            {'userUuid': widget.userUuid, 'action': 'start_conversation'}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final chatId = responseData['chatId'] ?? widget.userUuid;

        // Salvar a conversa no Supabase
        await SupaFlow.client.from('chat_support').upsert(
          {'chat_id': chatId, 'started_at': DateTime.now().toIso8601String()},
        );

        setState(() {
          _chatId = chatId;
          _messages = [];
        });

        // Adicionar mensagem de boas-vindas
        _addBotMessage(
          text: 'Olá! Como posso ajudar você hoje?',
        );
      } else {
        throw Exception('Falha ao iniciar conversa: ${response.statusCode}');
      }
    } catch (e) {
      _showError('Erro ao iniciar conversa: $e');
    }
  }

  // Enviar mensagem de texto
  Future<void> _sendTextMessage(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(
        text: text,
        isFromBot: false,
      ));
      _textController.clear();
      _isLoading = true;
    });

    await _saveMessageToSupabase(text, 'text');
    await _sendMessageToWebhook(text, 'text');
  }

  // Enviar imagem
  Future<void> _sendImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true, // Para obter os bytes da imagem
      );

      if (result != null) {
        final file = result.files.single;
        final bytes = file.bytes;

        if (bytes == null) {
          _showError('Não foi possível ler os dados da imagem');
          return;
        }

        // Converter para base64
        final base64Image = base64Encode(bytes);

        // Criar string base64 com cabeçalho
        final fileName = file.name.toLowerCase();
        final mimeType = fileName.endsWith('.png')
            ? 'image/png'
            : fileName.endsWith('.gif')
                ? 'image/gif'
                : 'image/jpeg';

        final base64WithHeader = 'data:$mimeType;base64,$base64Image';

        setState(() {
          _messages.add(ChatMessage(
            imageUrl: base64WithHeader,
            isFromBot: false,
          ));
          _isLoading = true;
        });

        // Salvar no Supabase
        await _saveMessageToSupabase(base64WithHeader, 'image');

        // Enviar para webhook
        await _sendMessageToWebhook(base64WithHeader, 'image');
      }
    } catch (e) {
      _showError('Erro ao enviar imagem: $e');
    }
  }

  // Alternar gravação de áudio
  void _toggleRecording() {
    if (_isRecording) {
      // Parar simulação de gravação e enviar
      _simulateSendAudio();
    } else {
      // Iniciar simulação de gravação
      setState(() {
        _isRecording = true;
        _recordingDuration = 0;
        _recordingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            _recordingDuration++;
          });
        });
      });
    }
  }

  // Enviar áudio (em uma implementação real, você enviaria o arquivo)
  Future<void> _sendAudioMessage(String audioBase64, int duration) async {
    setState(() {
      _messages.add(ChatMessage(
        audioUrl: audioBase64,
        isFromBot: false,
        audioDuration: duration,
      ));
      _isLoading = true;
    });

    // Salvar no Supabase (em uma implementação real)
    await _saveMessageToSupabase(audioBase64, 'audio');

    // Enviar para webhook
    await _sendMessageToWebhook(audioBase64, 'audio');
  }

  // Método para simular gravação de áudio
  Future<void> _simulateSendAudio() async {
    try {
      // Criar dados de áudio simulados mais realísticos (ruído branco)
      final Random random = Random();
      final int sampleRate = 8000; // 8kHz
      final int seconds = _recordingDuration > 0 ? _recordingDuration : 3;
      final int numSamples = sampleRate * seconds;

      // Criar cabeçalho WAV
      List<int> header = [
        // RIFF header
        0x52, 0x49, 0x46, 0x46, // "RIFF"
        0, 0, 0, 0, // Tamanho total (será preenchido depois)
        0x57, 0x41, 0x56, 0x45, // "WAVE"

        // fmt subchunk
        0x66, 0x6D, 0x74, 0x20, // "fmt "
        16, 0, 0, 0, // Tamanho do subchunk fmt (16 bytes)
        1, 0, // Formato de áudio (1 = PCM)
        1, 0, // Número de canais (1 = mono)

        // Taxa de amostragem (8000Hz)
        (sampleRate & 0xff),
        ((sampleRate >> 8) & 0xff),
        ((sampleRate >> 16) & 0xff),
        ((sampleRate >> 24) & 0xff),

        // Bytes por segundo (8000 * 1 * 8/8)
        (sampleRate & 0xff),
        ((sampleRate >> 8) & 0xff),
        ((sampleRate >> 16) & 0xff),
        ((sampleRate >> 24) & 0xff),

        1, 0, // Alinhamento de bloco (1 byte)
        8, 0, // Bits por amostra (8 bits)

        // data subchunk
        0x64, 0x61, 0x74, 0x61, // "data"
        0, 0, 0, 0, // Tamanho dos dados (será preenchido depois)
      ];

      // Criar dados de áudio (ruído branco)
      List<int> audioData =
          List.generate(numSamples, (i) => 128 + random.nextInt(20) - 10);

      // Atualizar tamanhos nos cabeçalhos
      int dataSize = audioData.length;
      int fileSize = 36 + dataSize;

      // Preencher tamanho total (4 bytes depois de "RIFF")
      header[4] = fileSize & 0xff;
      header[5] = (fileSize >> 8) & 0xff;
      header[6] = (fileSize >> 16) & 0xff;
      header[7] = (fileSize >> 24) & 0xff;

      // Preencher tamanho dos dados (4 bytes depois de "data")
      header[40] = dataSize & 0xff;
      header[41] = (dataSize >> 8) & 0xff;
      header[42] = (dataSize >> 16) & 0xff;
      header[43] = (dataSize >> 24) & 0xff;

      // Combinar cabeçalho e dados
      List<int> wavBytes = [...header, ...audioData];

      // Converter para base64
      final base64Audio = base64Encode(wavBytes);

      // Criar string base64 com cabeçalho
      final base64WithHeader = 'data:audio/wav;base64,$base64Audio';

      final audioDuration = seconds;

      setState(() {
        _isRecording = false;
        _recordingDuration = 0;
      });

      // Enviar áudio simulado
      _sendAudioMessage(base64WithHeader, audioDuration);
    } catch (e) {
      setState(() {
        _isRecording = false;
        _recordingDuration = 0;
      });
      _showError('Erro ao simular envio de áudio: $e');
    }
  }

  // Salvar mensagem no Supabase
  Future<void> _saveMessageToSupabase(String content, String type) async {
    try {
      await SupaFlow.client.from('chat_messages').insert({
        'chat_id': _chatId as Object,
        'message_type': type,
        'content': content,
        'sent_by_bot': false,
      });
    } catch (e) {
      _showError('Erro ao salvar mensagem: $e');
    }
  }

  // Enviar mensagem para o webhook
  Future<void> _sendMessageToWebhook(String content, String type) async {
    try {
      final response = await http.post(
        Uri.parse(widget.webhook),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'chatId': _chatId,
          'userUuid': widget.userUuid,
          'content': content,
          'type': type,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final botResponse = responseData['response'] ?? 'Recebido.';

        // Adicionar resposta do bot
        _addBotMessage(text: botResponse);
      } else {
        throw Exception('Falha ao enviar mensagem: ${response.statusCode}');
      }
    } catch (e) {
      _showError('Erro ao enviar mensagem para API: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Adicionar mensagem do bot
  Future<void> _addBotMessage(
      {String? text, String? imageUrl, String? audioUrl}) async {
    setState(() {
      _messages.add(ChatMessage(
        text: text,
        imageUrl: imageUrl,
        audioUrl: audioUrl,
        isFromBot: true,
      ));
    });

    if (text != null) {
      await SupaFlow.client.from('chat_messages').insert({
        'chat_id': _chatId as Object,
        'message_type': 'text',
        'content': text,
        'sent_by_bot': true,
      });
    } else if (imageUrl != null) {
      await SupaFlow.client.from('chat_messages').insert({
        'chat_id': _chatId as Object,
        'message_type': 'image',
        'content': imageUrl,
        'sent_by_bot': true,
      });
    } else if (audioUrl != null) {
      await SupaFlow.client.from('chat_messages').insert({
        'chat_id': _chatId as Object,
        'message_type': 'audio',
        'content': audioUrl,
        'sent_by_bot': true,
      });
    }
  }

  // Mostrar erro
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  // Reproduzir ou pausar áudio
  void _playPauseAudio(String audioUrl) {
    setState(() {
      if (_currentAudioPlaying == audioUrl && _isPlayingAudio) {
        // Pausar o atual
        _isPlayingAudio = false;
        _currentAudioPlaying = null;
      } else {
        // Tocar um novo
        _isPlayingAudio = true;
        _currentAudioPlaying = audioUrl;
      }
    });

    // Em uma implementação real, você usaria um player de áudio
    // com um callback ao finalizar para atualizar o estado
    if (_isPlayingAudio) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted && _currentAudioPlaying == audioUrl) {
          setState(() {
            _isPlayingAudio = false;
            _currentAudioPlaying = null;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 600,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          // Cabeçalho do chat
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.support_agent,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Suporte ao Cliente',
                      style: FlutterFlowTheme.of(context).titleMedium!.copyWith(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                TextButton.icon(
                  onPressed: _startNewConversation,
                  icon: Icon(
                    Icons.refresh_rounded,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  label: Text(
                    'Nova Conversa',
                    style: FlutterFlowTheme.of(context).bodyMedium!.copyWith(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor:
                        FlutterFlowTheme.of(context).primary.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Corpo do chat
          Expanded(
            child: _isLoading && _messages.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    reverse: false,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return _buildMessageBubble(message);
                    },
                  ),
          ),

          // Indicador de digitação
          if (_isLoading && _messages.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildDot(0),
                      _buildDot(1),
                      _buildDot(2),
                    ],
                  ),
                ),
              ),
            ),

          // Barra de gravação de áudio
          if (_isRecording)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.mic, color: Colors.red),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Gravando: ${_formatDuration(_recordingDuration)}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium!.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: _toggleRecording,
                    icon: const Icon(Icons.send, color: Colors.red),
                  ),
                ],
              ),
            ),

          // Barra de input
          if (!_isRecording)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: _sendImage,
                    icon: Icon(
                      Icons.image_outlined,
                      color: FlutterFlowTheme.of(context)
                          .primaryText
                          .withOpacity(0.6),
                    ),
                  ),
                  IconButton(
                    onPressed: _toggleRecording,
                    icon: Icon(
                      Icons.mic_outlined,
                      color: FlutterFlowTheme.of(context)
                          .primaryText
                          .withOpacity(0.6),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Digite sua mensagem...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyMedium!.copyWith(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText
                                      .withOpacity(0.5),
                                ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      maxLines: 3,
                      minLines: 1,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.send,
                      onSubmitted: _sendTextMessage,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(22.5),
                    ),
                    child: IconButton(
                      onPressed: () => _sendTextMessage(_textController.text),
                      icon: Icon(
                        Icons.send_rounded,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Construir bolha de mensagem
  Widget _buildMessageBubble(ChatMessage message) {
    final isFromBot = message.isFromBot;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment:
            isFromBot ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isFromBot)
            Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.only(right: 8, bottom: 4),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.support_agent,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 16,
              ),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: message.text != null
                ? const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                : const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isFromBot
                  ? FlutterFlowTheme.of(context).secondaryBackground
                  : FlutterFlowTheme.of(context).primary,
              borderRadius: BorderRadius.circular(20).copyWith(
                bottomLeft: isFromBot ? const Radius.circular(0) : null,
                bottomRight: !isFromBot ? const Radius.circular(0) : null,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: _buildMessageContent(message, isFromBot),
          ),
          if (!isFromBot)
            Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.only(left: 8, bottom: 4),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 16,
              ),
            ),
        ],
      ),
    );
  }

  // Construir conteúdo da mensagem
  Widget _buildMessageContent(ChatMessage message, bool isFromBot) {
    if (message.text != null) {
      return Text(
        message.text!,
        style: FlutterFlowTheme.of(context).bodyMedium!.copyWith(
              color: isFromBot
                  ? FlutterFlowTheme.of(context).primaryText
                  : FlutterFlowTheme.of(context).primaryBackground,
            ),
      );
    } else if (message.imageUrl != null) {
      // Verificar se é base64
      if (message.imageUrl!.startsWith('data:image')) {
        try {
          final imageData = message.imageUrl!.split(',')[1];
          final imageBytes = base64Decode(imageData);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.memory(
                  imageBytes,
                  width: 200,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade300,
                    width: 200,
                    height: 150,
                    child: const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Imagem',
                style: FlutterFlowTheme.of(context).bodySmall!.copyWith(
                      color: isFromBot
                          ? FlutterFlowTheme.of(context)
                              .primaryText
                              .withOpacity(0.7)
                          : FlutterFlowTheme.of(context)
                              .primaryBackground
                              .withOpacity(0.7),
                    ),
              ),
            ],
          );
        } catch (e) {
          // Caso haja erro ao decodificar base64, trata como URL normal
          return _buildImageFromUrl(message.imageUrl!, isFromBot);
        }
      } else {
        // URL normal
        return _buildImageFromUrl(message.imageUrl!, isFromBot);
      }
    } else if (message.audioUrl != null) {
      final isPlaying =
          _currentAudioPlaying == message.audioUrl && _isPlayingAudio;
      final audioDuration = message.audioDuration ?? 15;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: isFromBot
                  ? FlutterFlowTheme.of(context).primaryBackground
                  : FlutterFlowTheme.of(context).primary.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _playPauseAudio(message.audioUrl!),
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: isFromBot
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: isFromBot
                          ? FlutterFlowTheme.of(context)
                              .primary
                              .withOpacity(0.3)
                          : FlutterFlowTheme.of(context)
                              .primaryBackground
                              .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex: isPlaying ? 4 : 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: isFromBot
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: isPlaying ? 6 : 9,
                          child: const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _formatDuration(audioDuration),
                  style: FlutterFlowTheme.of(context).bodySmall!.copyWith(
                        color: isFromBot
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).primaryBackground,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Áudio',
            style: FlutterFlowTheme.of(context).bodySmall!.copyWith(
                  color: isFromBot
                      ? FlutterFlowTheme.of(context)
                          .primaryText
                          .withOpacity(0.7)
                      : FlutterFlowTheme.of(context)
                          .primaryBackground
                          .withOpacity(0.7),
                ),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  // Construir imagem a partir de URL
  Widget _buildImageFromUrl(String url, bool isFromBot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: url,
            width: 200,
            height: 150,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey.shade300,
              width: 200,
              height: 150,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey.shade300,
              width: 200,
              height: 150,
              child: const Icon(Icons.error),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Imagem',
          style: FlutterFlowTheme.of(context).bodySmall!.copyWith(
                color: isFromBot
                    ? FlutterFlowTheme.of(context).primaryText.withOpacity(0.7)
                    : FlutterFlowTheme.of(context)
                        .primaryBackground
                        .withOpacity(0.7),
              ),
        ),
      ],
    );
  }

  // Animação de dots para indicador de digitação
  Widget _buildDot(int index) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }

  // Formatar duração em MM:SS
  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}

// Classe para representar uma mensagem
class ChatMessage {
  final String? text;
  final String? imageUrl;
  final String? audioUrl;
  final bool isFromBot;
  final int? audioDuration; // em segundos

  ChatMessage({
    this.text,
    this.imageUrl,
    this.audioUrl,
    required this.isFromBot,
    this.audioDuration,
  });
}
