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
import 'package:audioplayers/audioplayers.dart';

Future<String> audioTranscriptionAndPlay(
  String apiKeyGroq,
  String apiKeyElevenLabs,
  String voiceId,
  FFUploadedFile? file,
  String language, // Parâmetro de idioma (en/pt)
  String prompt, // Novo parâmetro para prompt do Groq
  String modelIdElevenLabs, // Novo parâmetro para model ID do ElevenLabs
) async {
  // Validação do idioma (en ou pt)
  final validLanguage =
      (language == 'en' || language == 'pt') ? language : 'en';

  // Verificação do arquivo
  if (file == null || file.bytes == null) {
    return 'Error: Invalid audio file';
  }

  // --- 1. TRANSCRIÇÃO COM GROQ (WHISPER) ---
  String transcribedText;
  try {
    final request = http.MultipartRequest('POST',
        Uri.parse("https://api.groq.com/openai/v1/audio/transcriptions"));

    // Usa o prompt fornecido ou define um padrão baseado no idioma
    final effectivePrompt = prompt.isNotEmpty
        ? prompt
        : validLanguage == 'en'
            ? 'Translate'
            : 'Traduza para pt-BR';

    request.headers['Authorization'] = 'Bearer $apiKeyGroq';
    request.fields.addAll({
      'model': 'whisper-large-v3',
      'response_format': 'verbose_json',
      'prompt': effectivePrompt,
      'language': validLanguage,
    });

    request.files.add(http.MultipartFile.fromBytes(
      'file',
      file.bytes!,
      filename: 'audio.m4a',
    ));

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode != 200) {
      return 'Groq Error (${response.statusCode}): $responseBody';
    }

    final jsonResponse = jsonDecode(responseBody);
    transcribedText = jsonResponse['text']?.toString() ?? '';

    if (transcribedText.isEmpty) {
      return 'Error: Transcription failed';
    }
  } catch (e) {
    return 'Groq Error: ${e.toString()}';
  }

  // --- 2. TTS E REPRODUÇÃO (ELEVENLABS) ---
  try {
    final player = AudioPlayer();
    final ttsResponse = await http.post(
      Uri.parse("https://api.elevenlabs.io/v1/text-to-speech/$voiceId"),
      headers: {
        'xi-api-key': apiKeyElevenLabs,
        'Content-Type': 'application/json',
        'Accept': 'audio/mpeg',
      },
      body: jsonEncode({
        "text": transcribedText,
        "model_id": modelIdElevenLabs, // Usa o model_id fornecido
        "voice_settings": {
          "stability": 0.5,
          "similarity_boost": 0.8,
          "speaker_boost": true
        }
      }),
    );

    if (ttsResponse.statusCode == 200) {
      await player.play(BytesSource(ttsResponse.bodyBytes));
      return 'Language: $validLanguage\nText: $transcribedText';
    } else {
      return 'ElevenLabs Error (${ttsResponse.statusCode}): ${ttsResponse.body}';
    }
  } catch (e) {
    return 'TTS Error: ${e.toString()}';
  }
}
