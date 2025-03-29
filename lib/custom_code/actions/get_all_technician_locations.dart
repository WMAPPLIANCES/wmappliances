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

Future<List<dynamic>?> getAllTechnicianLocations() async {
  try {
    // Buscar localizações dos técnicos do Supabase
    final response = await Supabase.instance.client
        .from('technician_locations')
        .select()
        .order('updated_at', ascending: false);

    if (response == null) return [];

    // Converter para uma lista utilizável no FlutterFlow
    return (response as List)
        .map((location) => {
              'id': location['id'],
              'technicianId': location['technician_id'],
              'latitude': location['latitude'],
              'longitude': location['longitude'],
              'accuracy': location['accuracy'],
              'speed': location['speed'],
              'updatedAt': location['updated_at'],
            })
        .toList();
  } catch (e) {
    print('Erro ao buscar localizações: $e');
    return [];
  }
}
