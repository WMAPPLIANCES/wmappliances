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
// CORRECT IMPORT FOR HTTP PACKAGE:
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart'; // Import for debugPrint

// Function to send customer form data to an n8n webhook
Future<String> sendCustomerFormDataToN8n(
  String webhook, // REQUIRED: The n8n webhook URL
  String? customerName,
  String? customerPhone,
  String? customerEmail,
  String? address,
  String? apartmentNumber,
  String? tenantName,
  String? tenantPhone,
  // Pass the items list as a JSON Encoded String from FlutterFlow
  String? itemsJsonString,
  // Optional: Include work_order_id if needed
  String? workOrderId,
) async {
  // 1. Validate Webhook URL
  if (webhook.isEmpty || !Uri.tryParse(webhook)!.isAbsolute) {
    const errorMsg =
        'Webhook URL is empty or invalid. Please provide a valid webhook URL.';
    debugPrint(errorMsg);
    return 'Error: $errorMsg';
  }

  // 2. Prepare Items List
  List<dynamic> itemsList = []; // Default to an empty list
  if (itemsJsonString != null && itemsJsonString.isNotEmpty) {
    try {
      // Attempt to decode the JSON string passed from FlutterFlow
      itemsList = jsonDecode(itemsJsonString);
      // Ensure it's actually a list
      if (itemsList is! List) {
        debugPrint('Decoded itemsJsonString is not a List. Using empty list.');
        itemsList = [];
      }
    } catch (e) {
      debugPrint('Error decoding itemsJsonString: $e. Using empty list.');
      itemsList = []; // Use empty list if decoding fails
    }
  }

  // 3. Create the request body map
  // Use empty strings as defaults for null optional fields to avoid sending 'null'
  final Map<String, dynamic> requestBody = {
    // Use the field names from your database/n8n workflow
    'customer_name': customerName ?? '',
    'customer_phone': customerPhone ?? '',
    'customer_email': customerEmail ?? '',
    'address': address ?? '',
    'apartment_number': apartmentNumber ?? '',
    'tenant_name': tenantName ?? '',
    'tenant_phone': tenantPhone ?? '',
    'items': itemsList, // Add the decoded list here
    // Include work_order_id if it's not null or empty
    if (workOrderId != null && workOrderId.isNotEmpty)
      'work_order_id': workOrderId,
  };

  // Optional: Remove keys with empty string values if desired
  // requestBody.removeWhere((key, value) => value is String && value.isEmpty);

  // 4. Encode the entire body to JSON
  final String jsonBody = jsonEncode(requestBody);
  debugPrint('Sending JSON to n8n: $jsonBody'); // Log the data being sent

  // 5. Make the HTTP POST request
  try {
    final response = await http.post(
      // This should now work correctly
      Uri.parse(webhook),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    // 6. Handle the response
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final successMsg =
          'Successfully sent data to n8n. Status: ${response.statusCode}';
      debugPrint(successMsg);
      debugPrint('n8n Response: ${response.body}');
      return 'Success: ${response.body}'; // Return success message from n8n if any
    } else {
      final errorMsg =
          'Failed to send data to n8n. Status: ${response.statusCode}. Body: ${response.body}';
      debugPrint(errorMsg);
      return 'Error: $errorMsg';
    }
  } catch (e) {
    // 7. Handle network or other errors during the request
    final errorMsg = 'Exception caught sending data to n8n: $e';
    debugPrint(errorMsg);
    return 'Error: $errorMsg';
  }
}
// DO NOT REMOVE OR MODIFY THE CODE BELOW!
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
