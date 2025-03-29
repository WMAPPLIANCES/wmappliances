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

Future<String> n8nApiCallAddPart(
  String webhook,
  String? item,
  String workOrderId,
  String? diagnosisId,
  String? techName,
  String? partName,
  String? partNumber,
  String? quantityStr, // Recebe quantity como String do TextField
  String? partCostStr, // Recebe partCost como String do TextField
  String? link,
) async {
  // 1. Se o webhook estiver vazio, retorne mensagem de erro (e não nulo).
  if (webhook.isEmpty) {
    debugPrint('Webhook URL está vazio. Por favor, forneça um webhook válido.');
    return 'Erro: Webhook vazio.';
  }

  // 2. Use valores padrão se os parâmetros forem nulos ou vazios.
  //    Assim, evitamos problemas de null ao criar o requestBody.
  final localItem = item ?? 'Item padrão';
  final localDiagnosisId = diagnosisId ?? 'Diagnosis padrão';
  final localTechName = techName ?? 'TechName padrão';
  final localPartName = partName ?? 'PartName padrão';
  final localPartNumber = partNumber ?? 'PartNumber padrão';
  final localLink = link ?? 'Link padrão';

  // 3. Tenta converter quantityStr para int, usando 0 como padrão em caso de erro.
  final quantity = (quantityStr != null && quantityStr.isNotEmpty)
      ? int.tryParse(quantityStr) ?? 0
      : 0;

  // 4. Tenta converter partCostStr para double, usando 0.0 como padrão em caso de erro.
  final partCost = (partCostStr != null && partCostStr.isNotEmpty)
      ? double.tryParse(partCostStr) ?? 0.0
      : 0.0;

  // 5. Cria o corpo da requisição com os valores tratados.
  final Map<String, dynamic> requestBody = {
    'item': localItem,
    'workOrderId': workOrderId,
    'diagnosisId': localDiagnosisId,
    'techName': localTechName,
    'part_name': localPartName,
    'part_number': localPartNumber,
    'quantity': quantity,
    'part_cost': partCost,
    'link': localLink,
  };

  // Caso queira remover apenas chaves com strings vazias, descomente:
  // requestBody.removeWhere(
  //   (key, value) => value is String && value.isEmpty
  // );

  // 6. Converte o corpo da requisição para JSON
  final String jsonBody = jsonEncode(requestBody);

  try {
    // 7. Faz a chamada POST para o webhook do n8n
    final response = await http.post(
      Uri.parse(webhook),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    // 8. Verifica o código de status da resposta
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Chamada bem-sucedida
      debugPrint('Chamada para o n8n API (addPart) bem-sucedida!');
      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      // Retorna uma string de sucesso (não-nula)
      return 'Sucesso: ${response.body}';
    } else {
      // Chamada falhou
      debugPrint('Chamada para o n8n API (addPart) falhou.');
      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      // Retorna uma string de erro (não-nula)
      return 'Erro: ${response.body}';
    }
  } catch (e) {
    // 9. Erro na requisição (ex: problema de rede)
    debugPrint('Erro ao chamar o n8n API (addPart): $e');
    return 'Erro: $e';
  }
}
