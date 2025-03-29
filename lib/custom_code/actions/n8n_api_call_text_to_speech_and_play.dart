// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart'; // Import para debugPrint no Flutter web/mobile
import 'package:audioplayers/audioplayers.dart'; // Import do pacote audioplayers

Future<void> n8nApiCallTextToSpeechAndPlay(
  String webhook,
  String text,
) async {
  // Verifica se o webhook foi fornecido
  if (webhook.isEmpty) {
    debugPrint('Webhook URL está vazio. Por favor, forneça um webhook válido.');
    return; // Sai da função se o webhook estiver vazio
  }

  // Verifica se o texto foi fornecido
  if (text.isEmpty) {
    debugPrint('Texto para conversão em voz está vazio.');
    return; // Sai da função se o texto estiver vazio
  }

  try {
    // Faz a chamada POST para o webhook do n8n, enviando o texto no corpo da requisição
    final response = await http.post(
      Uri.parse(webhook), // Converte a string do webhook para Uri
      headers: {
        'Content-Type': 'text/plain' // Define o cabeçalho para texto plano
      },
      body: text, // Envia o texto como corpo da requisição
    );

    // Verifica o código de status da resposta
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Chamada bem-sucedida (códigos 2xx)
      debugPrint('Chamada para o n8n API bem-sucedida!');
      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Recebido áudio do n8n.');

      // Obtém os bytes do corpo da resposta, que devem ser os dados de áudio
      final audioBytes = response.bodyBytes;

      // Inicializa o player de áudio
      final player = AudioPlayer();

      // Define o source como os bytes de áudio recebidos
      final source = BytesSource(audioBytes);

      // Tenta tocar o áudio
      try {
        await player.play(source);
        debugPrint('Áudio iniciado.');
      } catch (audioError) {
        debugPrint('Erro ao tocar o áudio: $audioError');
      }
    } else {
      // Chamada falhou (códigos de erro 4xx, 5xx, etc.)
      debugPrint(
          'Chamada para o n8n API falhou com status code: ${response.statusCode}');
      debugPrint(
          'Response body: ${response.body}'); // Imprime o corpo da resposta para ajudar no debug
      // Trate o erro aqui, se necessário (ex: mostrar uma mensagem de erro ao usuário)
    }
  } catch (e) {
    // Erro ao fazer a requisição (ex: problema de rede, erro ao parsear JSON, etc.)
    debugPrint('Erro ao chamar o n8n API: $e');
    // Trate o erro aqui, se necessário (ex: mostrar uma mensagem de erro ao usuário)
  }
}

// Para usar este Custom Action no FlutterFlow:
// 1. Certifique-se de ter adicionado 'audioplayers' às dependências do seu projeto no pubspec.yaml.
//    Você pode fazer isso adicionando `audioplayers: ^5.2.1` (ou a versão mais recente) em seu pubspec.yaml
//    e executando `flutter pub get` no terminal.
// 2. No FlutterFlow, vá para Custom Actions e crie um novo Custom Action.
// 3. Cole este código no editor de Custom Action.
// 4. Defina os argumentos:
//    - webhook (String, não nulo)
//    - text (String, não nulo)
// 5. Use este Custom Action em um botão ou ação de fluxo de trabalho, passando o URL do webhook e o texto que você deseja converter em voz.
