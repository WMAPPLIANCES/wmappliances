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

import 'index.dart'; // Imports other custom actions

import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<dynamic>> getTechnicianLocationAction() async {
  try {
    // Verificar o serviço de localização
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return [
        {
          'success': false,
          'message': 'Serviço de localização desativado',
          'data': null
        }
      ];
    }

    // Verificar permissões
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return [
          {
            'success': false,
            'message': 'Permissão de localização negada',
            'data': null
          }
        ];
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return [
        {
          'success': false,
          'message': 'Permissões de localização negadas permanentemente',
          'data': null
        }
      ];
    }

    // Obter usuário logado
    final currentUser = Supabase.instance.client.auth.currentUser;
    if (currentUser == null) {
      return [
        {'success': false, 'message': 'Usuário não autenticado', 'data': null}
      ];
    }

    // Obter localização atual
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Atualizar localização no AppState
    FFAppState().update(() {
      FFAppState().currentLocation = LatLng(
        position.latitude,
        position.longitude,
      );
    });

    // Salvar localização no banco de dados
    await Supabase.instance.client.from('technician_locations').upsert({
      'technician_id': currentUser.id,
      'latitude': position.latitude,
      'longitude': position.longitude,
      'accuracy': position.accuracy,
      'speed': position.speed,
    }, onConflict: 'technician_id');

    // Buscar informações adicionais (opcional)
    final tecnicoData = await Supabase.instance.client
        .from('technician_locations')
        .select('*, users!inner(full_name, user_photo, role)')
        .eq('technician_id', currentUser.id)
        .single();

    // Retornar sucesso e dados
    return [
      {
        'success': true,
        'message': 'Localização atualizada com sucesso',
        'data': {
          'technician_id': currentUser.id,
          'latitude': position.latitude,
          'longitude': position.longitude,
          'accuracy': position.accuracy,
          'speed': position.speed,
          'updated_at': DateTime.now().toIso8601String(),
          'technician_info': tecnicoData['users'] ?? {},
        }
      }
    ];
  } catch (e) {
    return [
      {
        'success': false,
        'message': 'Erro ao atualizar localização: $e',
        'data': null
      }
    ];
  }
}
