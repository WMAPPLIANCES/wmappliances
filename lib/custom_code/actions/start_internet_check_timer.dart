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

import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Future<void> startInternetCheckTimer() async {
  // Inicia o listener para mudanças no status da internet
  final listener =
      InternetConnection().onStatusChange.listen((InternetStatus status) {
    switch (status) {
      case InternetStatus.connected:
        // Atualiza o App State 'isOffline' para false quando conectado
        FFAppState().update(() {
          FFAppState().isOffline =
              false; // Define isOffline para false quando conectado
        });
        break;

      case InternetStatus.disconnected:
        // Atualiza o App State 'isOffline' para true quando desconectado
        FFAppState().update(() {
          FFAppState().isOffline =
              true; // Define isOffline para true quando desconectado
        });
        break;
    }
  });

  // O listener 'listener' está ativo e verificando a conexão a cada 10 segundos (ou no evento de mudança de status)
  // Para um checker global, geralmente você quer que ele rode durante toda a vida do app.
  // Se precisar cancelar o listener em algum momento (o que não deve ser o caso aqui), você pode usar listener.cancel();
}

// DO NOT REMOVE OR MODIFY THE CODE BELOW!
