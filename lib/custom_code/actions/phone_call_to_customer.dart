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

// Adicione o import do pacote http
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Ensure this function name EXACTLY matches the "Action Name" in FlutterFlow UI
Future<bool> phoneCallToCustomer(
  String technicianNumber,
  String customerNumber,
) async {
  final url = Uri.parse('https://phone.wmappliances.cloud/start-masked-call');

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'technicianNumber': technicianNumber,
        'customerNumber': customerNumber,
      }),
    );

    if (response.statusCode == 200) {
      // Chamada realizada com sucesso
      return true;
    } else {
      // Caso queira debugar ou tratar o erro
      print('Erro na requisição: StatusCode: ${response.statusCode}');
      print('Corpo da resposta: ${response.body}');
      return false;
    }
  } catch (e) {
    // Captura qualquer exceção lançada
    print('Exceção lançada: $e');
    return false;
  }
}
