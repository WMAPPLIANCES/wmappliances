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

Future<String> audioTranscriptionEnPt(
  String model,
  String apiKey,
  FFUploadedFile? file, // Make file nullable to handle potential null values
) async {
  if (file == null || file.bytes == null || file.name == null) {
    return 'Error: Audio file is missing or invalid.'; // Handle null file case
  }

  final apiUrl =
      Uri.parse("https://api.groq.com/openai/v1/audio/transcriptions");

  var request = http.MultipartRequest('POST', apiUrl);
  request.headers.addAll({
    'Authorization': 'Bearer $apiKey',
  });

  request.fields['model'] = model;
  request.fields['response_format'] = 'verbose_json';
  request.fields['prompt'] =
      '"You are a multilingual AI. You will receive an audio in either Portuguese (Brazil) or English. Your task is to transcribe and translate it into the other language. If the audio is in Portuguese, translate it into English. If the audio is in English, translate it into Portuguese. Provide only the translation, without any additional text, explanations, or comments."';
  request.fields['language'] = 'en'; // Define o idioma como inglês

  request.files.add(http.MultipartFile.fromBytes(
    'file', // This should match the API's expected field name for the file
    file.bytes!,
    filename: file.name,
  ));

  try {
    var response = await http.Client().send(request);
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      // Successful response
      try {
        final jsonResponse = jsonDecode(responseBody);
        final transcribedText = jsonResponse['text']; // Extrai o texto

        if (transcribedText != null) {
          return transcribedText; // Retorna somente o texto
        } else {
          return 'Error: Could not extract transcribed text from JSON response.';
        }
      } catch (e) {
        return 'Error: Failed to parse JSON response: $e. Response body: $responseBody'; // Retorna o body para debug
      }
    } else {
      // Error response
      return 'Error: API request failed with status code ${response.statusCode}. Response body: $responseBody';
    }
  } catch (e) {
    return 'Error: An unexpected error occurred: $e';
  }
}
