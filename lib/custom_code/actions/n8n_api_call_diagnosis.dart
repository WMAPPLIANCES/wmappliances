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

Future n8nApiCallDiagnosis(
  String webhook,
  String? item,
  String workOderId,
  String? aiNotes,
  String? ocrModelNumber,
  String? technicianName,
  String? image,
  String? updateDispatch,
  String? diagnosis,
  String? diagnosisId,
) async {
  // Verifica se o webhook foi fornecido
  if (webhook.isEmpty) {
    debugPrint('Webhook URL está vazio. Por favor, forneça um webhook válido.');
    return; // Sai da função se o webhook estiver vazio
  }

  // Cria o corpo da requisição (payload) que será enviado para o n8n
  final Map<String, dynamic> requestBody = {
    'item': item,
    'workOrderId': workOderId,
    'aiNotes': aiNotes,
    'ocrModelNumber': ocrModelNumber,
    'technicianName': technicianName,
    'image': image,
    'updateDispatch': updateDispatch,
    'diagnosis': diagnosis,
    'diagnosisId': diagnosisId,
  };

  // Converte o corpo da requisição para JSON
  final String jsonBody = jsonEncode(requestBody);

  try {
    // Faz a chamada POST para o webhook do n8n
    final response = await http.post(
      Uri.parse(webhook), // Converte a string do webhook para Uri
      headers: {
        'Content-Type': 'application/json'
      }, // Define o cabeçalho para JSON
      body: jsonBody, // Envia o corpo da requisição em JSON
    );

    // Verifica o código de status da resposta
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Chamada bem-sucedida (códigos 2xx)
      debugPrint('Chamada para o n8n API bem-sucedida!');
      debugPrint('Status code: ${response.statusCode}');
      debugPrint(
          'Response body: ${response.body}'); // Opcional: Imprime o corpo da resposta do n8n
      // Você pode processar a resposta do n8n aqui se necessário
    } else {
      // Chamada falhou (códigos de erro 4xx, 5xx, etc.)
      debugPrint(
          'Chamada para o n8n API falhou com status code: ${response.statusCode}');
      debugPrint(
          'Response body: ${response.body}'); // Imprime o corpo da resposta para ajudar no debug
      // Trate o erro aqui, se necessário (ex: mostrar uma mensagem de erro ao usuário)
    }
  } catch (e) {
    // Erro ao fazer a requisição (ex: problema de rede, erro ao parsear JSON)
    debugPrint('Erro ao chamar o n8n API: $e');
    // Trate o erro aqui, se necessário (ex: mostrar uma mensagem de erro ao usuário)
  }
}
