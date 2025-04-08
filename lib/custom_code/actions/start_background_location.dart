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
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Variável global para o Supabase Client (ou passe como parâmetro se preferir)
// Certifique-se que o Supabase foi inicializado antes de chamar esta action
// Geralmente no main.dart ou em uma action de inicialização.
final supabase = Supabase.instance.client;

// Flag para garantir que a inicialização ocorra apenas uma vez
bool isLocationServiceInitialized = false;

Future<void> startBackgroundLocation(String technicianId) async {
  // Evita inicializações múltiplas
  if (isLocationServiceInitialized) {
    print('BG Geolocation já inicializado.');
    // Opcional: verificar se está rodando e iniciar se não estiver
    bg.State state = await bg.BackgroundGeolocation.state;
    if (!state.enabled) {
      print('BG Geolocation não estava rodando. Iniciando...');
      bg.BackgroundGeolocation.start();
    }
    return;
  }

  print('Inicializando BG Geolocation para o técnico: $technicianId');

  // 1. Salvar o technicianId para uso em modo headless
  // É importante ter acesso a ele mesmo se o app for reiniciado/terminado
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('current_technician_id', technicianId);
  print('Technician ID salvo nas SharedPreferences.');

  // 2. Configurar o Listener de Localização
  bg.BackgroundGeolocation.onLocation((bg.Location location) async {
    print(
        '[location] - ${location.toJson()}'); // Use toJson() para ver todos os dados

    // Recuperar o ID do técnico salvo (importante para headless)
    final prefs = await SharedPreferences.getInstance();
    final currentTechnicianId = prefs.getString('current_technician_id');

    if (currentTechnicianId == null) {
      print('Erro: Não foi possível encontrar o technicianId salvo.');
      return; // Não envia se não tiver o ID
    }

    // Enviar para o Supabase
    try {
      final response = await supabase.from('technician_locations').insert({
        'technician_id': currentTechnicianId, // Use o ID recuperado/passado
        'latitude': location.coords?.latitude,
        'longitude': location.coords?.longitude,
        'accuracy': location.coords?.accuracy,
        'speed': location.coords?.speed,
        'updated_at': location.timestamp, // O timestamp da localização
        // Adicione outros campos se necessário (altitude, heading, etc.)
        // 'altitude': location.coords?.altitude,
        // 'heading': location.coords?.heading,
        // 'is_moving': location.isMoving, // Informação útil
        // 'activity_type': location.activity?.type, // Ex: 'still', 'on_foot', 'in_vehicle'
      });

      // Tratamento de erro do Supabase (opcional mas recomendado)
      // O código acima não trata erros diretamente, mas o Supabase client pode lançar exceções.
      // Para um tratamento mais robusto:
      // if (response.error != null) {
      //   print('Erro ao inserir no Supabase: ${response.error!.message}');
      // } else {
      //   print('Localização enviada para o Supabase com sucesso.');
      // }
      print('Localização enviada para o Supabase.');
    } catch (e) {
      print('Exceção ao enviar para o Supabase: $e');
    }
  });

  // Outros Listeners (Opcionais, mas úteis para debug)
  bg.BackgroundGeolocation.onMotionChange((bg.Location location) {
    print('[motionchange] - ${location.toJson()}');
  });

  bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
    print('[providerchange] - ${event.toJson()}');
  });

  bg.BackgroundGeolocation.onHttp((bg.HttpEvent event) {
    print('[http] success? ${event.success}, status? ${event.status}');
  });

  bg.BackgroundGeolocation.onError((bg.Error error) {
    print('[error] - ${error.toString()}');
  });

  // 3. Configurar o Plugin
  try {
    bg.State state = await bg.BackgroundGeolocation.ready(bg.Config(
      // --- Configurações Gerais ---
      desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH, // Precisão desejada
      distanceFilter:
          10.0, // Distância mínima (metros) para registrar nova localização. Ajuste conforme necessário. Se quiser focar no tempo, pode aumentar.
      stopOnTerminate:
          false, // !! IMPORTANTE: Continuar rodando se o app for fechado
      startOnBoot:
          true, // !! IMPORTANTE: Iniciar automaticamente após reiniciar o celular
      foregroundService:
          true, // Usar serviço de primeiro plano no Android (mais estável)

      // --- Configurações de Intervalo (para sua necessidade de 5 min) ---
      // O plugin é baseado em MOVIMENTO. Para forçar updates periódicos mesmo PARADO:
      heartbeatInterval:
          300, // !! IMPORTANTE: Intervalo em segundos (5 min = 300 seg). Envia um evento 'heartbeat' que pode ser usado para pegar localização.
      // OU use a estratégia de detecção de movimento:
      // stationaryRadius: 25, // Raio (metros) para considerar parado.
      // desiredAccuracy: bg.Config.DESIRED_ACCURACY_MEDIUM, // Pode reduzir precisão quando parado para economizar bateria
      // distanceFilter: 50, // Aumentar filtro de distância quando parado

      // --- Debug e Log ---
      debug:
          true, // true para ver logs detalhados no console durante desenvolvimento
      logLevel: bg.Config.LOG_LEVEL_VERBOSE, // Nível de log
      //logMaxDays: 3, // Reter logs por 3 dias (útil para debug)

      // --- Configurações de Rede e Sincronização (Não usaremos o HTTP interno, mas configuramos) ---
      // url: 'http://seu-servidor.com/locations', // Não necessário se enviar via Supabase no onLocation
      // autoSync: false, // Desabilitar sincronização automática interna
      // batchSync: false, // Desabilitar envio em lote interno

      // --- Configurações Específicas da Plataforma ---
      locationAuthorizationRequest:
          'Always', // Solicitar permissão "Sempre" no iOS
      backgroundPermissionRationale: bg.PermissionRationale(
          // Mensagem para permissão em background no Android
          title: "Permitir acesso à localização em segundo plano?",
          message:
              "Para rastrear sua rota continuamente, precisamos da sua localização mesmo quando o aplicativo está fechado.",
          positiveAction: "Permitir",
          negativeAction: "Cancelar"),
      // notification: bg.Notification( // Configuração da notificação persistente (Android Foreground Service)
      //     title: "Rastreamento de Localização Ativo",
      //     text: "Monitorando sua localização para o serviço.",
      //     channelName: "Location Tracking Service", // Obrigatório para Android 8+
      //     // smallIcon: "mipmap/ic_notification", // Use o nome do seu ícone sem extensão (ex: 'ic_launcher')
      //     // largeIcon: "mipmap/ic_launcher",
      //     // color: "#007bff", // Cor em formato Hex String
      //     priority: bg.Config.NOTIFICATION_PRIORITY_HIGH
      // )
    ));

    print('BG Geolocation Configurado. Estado inicial: ${state.enabled}');

    // Marca como inicializado
    isLocationServiceInitialized = true;

    // 4. Iniciar o Plugin (se não estiver habilitado)
    if (!state.enabled) {
      await bg.BackgroundGeolocation.start();
      print('BG Geolocation iniciado.');
    } else {
      print('BG Geolocation já estava rodando.');
      // Opcional: Sincronizar configurações se já estava rodando
      // await bg.BackgroundGeolocation.setConfig(bg.Config(...)); // Reaplica a config
    }

    // Opcional: Pedir para ignorar otimizações de bateria (Android)
    // bool isIgnoring = await bg.BackgroundGeolocation.isPowerSaveMode;
    // if (!isIgnoring) {
    //   bg.BackgroundGeolocation.requestPermissionRationale(
    //     title: "Otimização de Bateria",
    //     message: "Para garantir o rastreamento contínuo, por favor, desabilite a otimização de bateria para este app.",
    //     positiveAction: "Configurações",
    //     negativeAction: "Cancelar"
    //   ).then((bg.State state) {
    //     if (state.didRequestIgnoreBatteryOptimizations) {
    //        bg.BackgroundGeolocation.start(); // Reinicia se necessário após a permissão
    //     }
    //   });
    // }
  } catch (e) {
    print('Erro ao configurar/iniciar BG Geolocation: $e');
  }
}

// --- Função Headless (veja passo 5) ---
// É crucial registrar esta função fora da action, no nível superior do seu código customizado
// ou em um arquivo separado importado. FlutterFlow pode ter limitações aqui.

@pragma('vm:entry-point') // Necessário para Dart AOT compilation
void backgroundGeolocationHeadlessTask(bg.HeadlessEvent headlessEvent) async {
  print('📬 --> Evento Headless: ${headlessEvent.name}');
  print('📬 --> Dados: ${headlessEvent.event}');

  // É crucial inicializar plugins necessários aqui também, se aplicável
  // await Supabase.initialize(...); // Pode ser necessário re-inicializar o Supabase aqui
  // final supabaseClient = Supabase.instance.client; // Obter o client

  final prefs = await SharedPreferences.getInstance();
  final currentTechnicianId = prefs.getString('current_technician_id');

  if (currentTechnicianId == null) {
    print('Erro Headless: Não foi possível encontrar o technicianId salvo.');
    return;
  }

  bg.Location? location;

  // Tratar eventos específicos que podem conter localização
  if (headlessEvent.name == bg.Event.LOCATION) {
    location = headlessEvent.event as bg.Location;
    print('📬 Headless Location: ${location.toJson()}');
  } else if (headlessEvent.name == bg.Event.MOTIONCHANGE) {
    location = headlessEvent.event as bg.Location;
    print('📬 Headless MotionChange Location: ${location.toJson()}');
  } else if (headlessEvent.name == bg.Event.HEARTBEAT) {
    print('📬 Headless Heartbeat. Tentando obter localização atual...');
    try {
      location = await bg.BackgroundGeolocation.getCurrentPosition(
          samples: 1, // Pega uma amostra rápida
          persist: false, // Não precisa persistir, já que vamos enviar
          timeout: 10, // Timeout de 10 segundos
          extras: {"event": "heartbeat", "headless": true});
      print(
          '📬 Headless Heartbeat - Localização obtida: ${location?.toJson()}');
    } catch (e) {
      print('📬 Headless Heartbeat - Erro ao obter localização: $e');
    }
  } else if (headlessEvent.name == bg.Event.TERMINATE) {
    // Tenta pegar a última localização conhecida ao terminar
    print('📬 Headless Terminate. Tentando obter localização atual...');
    try {
      bg.State state = await bg.BackgroundGeolocation.state;
      if (!state.stopOnTerminate!) {
        // Só pega se não for parar ao terminar
        location = await bg.BackgroundGeolocation.getCurrentPosition(
            samples: 1,
            persist: true, // Persiste essa última localização
            extras: {"event": "terminate", "headless": true});
        print(
            '📬 Headless Terminate - Localização obtida: ${location?.toJson()}');
      } else {
        print(
            '📬 Headless Terminate - Configurado para parar, sem obter localização.');
      }
    } catch (error) {
      print("[getCurrentPosition] Headless Terminate ERROR: $error");
    }
  }
  // Adicione outros eventos se necessário (geofence, activitychange, etc.)

  // Se obtivemos uma localização em algum evento headless, enviar para o Supabase
  if (location != null && location.coords != null) {
    try {
      // !! IMPORTANTE: Re-inicialize o Supabase se necessário no Headless Task !!
      // Se o Supabase não estiver inicializado neste isolate, dará erro.
      // A forma mais segura pode ser usar um pacote http simples para enviar
      // ou garantir a inicialização correta do Supabase aqui.
      // Exemplo assumindo que `supabase` está acessível e inicializado:
      final supabaseClient =
          Supabase.instance.client; // Tenta pegar a instância

      await supabaseClient.from('technician_locations').insert({
        'technician_id': currentTechnicianId,
        'latitude': location.coords!.latitude,
        'longitude': location.coords!.longitude,
        'accuracy': location.coords!.accuracy,
        'speed': location.coords!.speed,
        'updated_at': location.timestamp,
        // Adicione outros campos conforme necessário
        'is_moving': location.isMoving,
        'activity_type': location.activity?.type,
        'event_source': headlessEvent.name, // Para saber qual evento gerou
        'is_headless': true, // Para diferenciar no banco
      });
      print('📬 Headless - Localização enviada para o Supabase.');
    } catch (e) {
      print('📬 Headless - Exceção ao enviar para o Supabase: $e');
      // Considere implementar uma fila offline ou retry mechanism aqui
    }
  }
}
