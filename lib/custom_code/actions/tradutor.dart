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

Future tradutor(
  String voiceId,
  String apiKeyElevenLabs,
  String
      required, // This argument seems unused, you can remove it if not needed
  String modelId,
  String text,
) async {
  // Check if the text is empty
  if (text.isEmpty) {
    print('Texto para síntese de voz está vazio.');
    return;
  }

  final String apiUrl = 'https://api.elevenlabs.io/v1/text-to-speech/$voiceId';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'xi-api-key': apiKeyElevenLabs,
        'Content-Type': 'application/json',
        'Accept': 'audio/mpeg'
      },
      body: jsonEncode({
        "text": text,
        "model_id": modelId,
      }),
    );

    if (response.statusCode == 200) {
      final player = AudioPlayer();
      await player.play(BytesSource(response.bodyBytes));
      print('Áudio tocando.');
    } else {
      print('Erro na requisição para ElevenLabs API: ${response.statusCode}');
      print('Corpo da resposta de erro: ${response.body}');
      // Handle error as needed
    }
  } catch (e) {
    print('Erro ao fazer a requisição ou tocar o áudio: $e');
    // Handle error as needed
  }
}
