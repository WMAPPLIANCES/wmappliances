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

import 'package:geolocator/geolocator.dart';

Future<bool> initializeLocationTracking() async {
  try {
    // Verificar se o serviço de localização está ativo
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    // Verificar permissões
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    // Atualizar o estado do rastreamento
    FFAppState().update(() {
      FFAppState().locationTrackingState = true;
    });

    // Obter posição atual e atualizar no AppState
    Position position = await Geolocator.getCurrentPosition();
    FFAppState().update(() {
      FFAppState().currentLocation = LatLng(
        position.latitude,
        position.longitude,
      );
    });

    // Opcional: Salvar no banco de dados
    final currentUser = Supabase.instance.client.auth.currentUser;
    if (currentUser != null) {
      await Supabase.instance.client.from('technician_locations').upsert({
        'technician_id': currentUser.id,
        'latitude': position.latitude,
        'longitude': position.longitude,
        'accuracy': position.accuracy,
        'speed': position.speed,
      }, onConflict: 'technician_id');
    }

    return true;
  } catch (e) {
    print('Erro ao inicializar rastreamento: $e');
    return false;
  }
}
