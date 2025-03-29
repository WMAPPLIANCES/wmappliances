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

import '/flutter_flow/custom_functions.dart';

import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LiveLocationTimer extends StatefulWidget {
  const LiveLocationTimer({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _LiveLocationTimerState createState() => _LiveLocationTimerState();
}

class _LiveLocationTimerState extends State<LiveLocationTimer> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Roda imediatamente ao iniciar
    _updateTechnicianLocation();

    // E depois a cada 5 minutos
    _timer = Timer.periodic(const Duration(minutes: 5), (timer) {
      _updateTechnicianLocation();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // invisível
  }

  Future<void> _updateTechnicianLocation() async {
    try {
      // Verifica se serviço está ativado
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Serviço de localização está desativado.');
      }

      // Permissões
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          throw Exception('Permissão de localização negada.');
        }
      }

      // Obtém localização atual
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Verifica se o usuário está autenticado
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        throw Exception('Usuário não autenticado.');
      }

      // Upsert no Supabase
      await Supabase.instance.client.from('technician_locations').upsert({
        'technician_id': user.id,
        'latitude': position.latitude,
        'longitude': position.longitude,
        'accuracy': position.accuracy,
        'speed': position.speed,
      }, onConflict: 'technician_id');

      print('📍 Localização atualizada com sucesso!');
    } catch (e) {
      print('❌ Erro ao atualizar localização: $e');
    }
  }
}
