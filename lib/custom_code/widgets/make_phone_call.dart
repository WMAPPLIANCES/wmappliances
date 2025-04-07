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

// End automatic FlutterFlow imports

// Imports for HTTP and JSON conversion
import 'dart:convert';
import 'package:http/http.dart' as http;

// Begin custom action code

Future<bool> startMaskedCall(
  String technicianNumber,
  String customerNumber,
) async {
  // Define the URL of your backend endpoint
  // Use the English version if you deployed that code
  final String url = 'https://phone.wmappliances.cloud/start-masked-call';
  // Or use the Portuguese version if you deployed that one
  // final String url = 'https://phone.wmappliances.cloud/iniciar-chamada-mascarada';

  // Define the headers for the HTTP request
  final Map<String, String> headers = {
    'Content-Type':
        'application/json; charset=UTF-8', // Standard header for JSON
  };

  // Create the request body map
  // Use the keys expected by your specific backend version (English or Portuguese)
  final Map<String, String> bodyMap = {
    'technicianNumber': technicianNumber, // Key for English version
    'customerNumber': customerNumber, // Key for English version
    // OR use these keys if using the Portuguese backend version:
    // 'tecnicoNumero': technicianNumber,
    // 'clienteNumero': customerNumber,
  };

  // Encode the body map into a JSON string
  final String requestBody = jsonEncode(bodyMap);

  // Print statements for debugging (visible in browser console during test/run mode)
  print('--- Starting Masked Call ---');
  print('URL: $url');
  print('Headers: $headers');
  print('Request Body: $requestBody');

  try {
    // Make the HTTP POST request
    final http.Response response = await http.post(
      Uri.parse(url), // Parse the URL string into a Uri object
      headers: headers,
      body: requestBody,
    );

    // Print response details for debugging
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    print('--- Masked Call Request End ---');

    // Check if the request was successful (HTTP status code 200)
    if (response.statusCode == 200) {
      // You could optionally decode the response JSON here if needed
      // final responseData = jsonDecode(response.body);
      // print('Success Message from Server: ${responseData['message']}');
      return true; // Indicate the API call was successful
    } else {
      // The server returned an error status code (4xx or 5xx)
      print(
          'API call failed with status code: ${response.statusCode}. Body: ${response.body}');
      return false; // Indicate the API call failed
    }
  } catch (e) {
    // An error occurred during the HTTP request (e.g., network issue, DNS error)
    print('Error making HTTP request: $e');
    print('--- Masked Call Request End (with error) ---');
    return false; // Indicate failure due to an exception
  }
}
// DO NOT REMOVE OR MODIFY THE CODE BELOW!
// End custom action code
