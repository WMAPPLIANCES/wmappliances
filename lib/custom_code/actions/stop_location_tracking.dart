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

Future<void> stopLocationTracking() async {
  // Atualizar o estado do rastreamento
  FFAppState().update(() {
    FFAppState().locationTrackingState = false;
  });

  // Observação: Para cancelar os listeners do Geolocator, seria necessário
  // manter referências às assinaturas. Como isso é complexo no FlutterFlow,
  // apenas atualizamos o estado.
}
