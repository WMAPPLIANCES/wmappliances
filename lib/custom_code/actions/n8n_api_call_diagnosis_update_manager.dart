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

// Nome da nova Custom Action
Future n8nApiCallDiagnosisUpdateManager(
  // Argumentos da função:
  String webhook, // URL do Webhook N8N (Obrigatório)
  String workOderId, // ID da Ordem de Serviço (Obrigatório)
  String? problemFound, // Problema encontrado (Opcional)
  String? solutionRequested, // Solução solicitada (Opcional)
  String? updateDispatch, // Atualização do despacho (Opcional)
  String? diagnosis, // Diagnóstico (Opcional)
  String? diagnosisId, // ID do Diagnóstico (Opcional)
) async {
  // Verifica se o webhook foi fornecido
  if (webhook.isEmpty) {
    debugPrint('Webhook URL está vazio. Por favor, forneça um webhook válido.');
    return; // Sai da função se o webhook estiver vazio
  }

  // Cria o corpo da requisição (payload) com os campos especificados
  final Map<String, dynamic> requestBody = {
    'workOrderId': workOderId,
    'problemFound': problemFound, // Incluído novo argumento
    'solutionRequested': solutionRequested, // Incluído novo argumento
    'updateDispatch': updateDispatch,
    'diagnosis': diagnosis,
    'diagnosisId': diagnosisId,
  };

  // Remove chaves com valores nulos do payload para não enviar campos vazios desnecessários
  // Isso é opcional, mas pode ser útil dependendo de como o N8N espera os dados.
  requestBody.removeWhere((key, value) => value == null);

  // Converte o corpo da requisição para JSON
  final String jsonBody = jsonEncode(requestBody);

  try {
    // Faz a chamada POST para o webhook do n8n
    debugPrint('Enviando requisição para: $webhook');
    debugPrint('Corpo da requisição (JSON): $jsonBody');

    final response = await http.post(
      Uri.parse(webhook), // Converte a string do webhook para Uri
      headers: {
        'Content-Type': 'application/json' // Define o cabeçalho para JSON
      },
      body: jsonBody, // Envia o corpo da requisição em JSON
    );

    // Verifica o código de status da resposta
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Chamada bem-sucedida (códigos 2xx)
      debugPrint('Chamada para o n8n API (UpdateManager) bem-sucedida!');
      debugPrint('Status code: ${response.statusCode}');
      debugPrint(
          'Response body: ${response.body}'); // Opcional: Imprime o corpo da resposta
    } else {
      // Chamada falhou (códigos de erro 4xx, 5xx, etc.)
      debugPrint(
          'Chamada para o n8n API (UpdateManager) falhou com status code: ${response.statusCode}');
      debugPrint(
          'Response body: ${response.body}'); // Imprime o corpo da resposta para debug
      // Considere adicionar tratamento de erro mais robusto aqui se necessário
    }
  } catch (e) {
    // Erro ao fazer a requisição (ex: problema de rede, erro ao parsear JSON)
    debugPrint('Erro ao chamar o n8n API (UpdateManager): $e');
    // Considere adicionar tratamento de erro mais robusto aqui se necessário
  }
}
// DO NOT REMOVE OR MODIFY THE CODE BELOW!
// End custom action code
