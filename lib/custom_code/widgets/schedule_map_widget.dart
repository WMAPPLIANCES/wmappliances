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

/// Automatic FlutterFlow imports
import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

// BEGIN FlutterFlow BOILERPLATE
import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
// END FlutterFlow BOILERPLATE

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:google_maps_routes/google_maps_routes.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui; // Para manipular imagens e canvas
import 'package:flutter/painting.dart'
    show TextSpan, TextPainter, TextStyle, TextAlign;
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';

class AppointmentModel {
  final String appointmentId;
  final DateTime? scheduledStart;
  final DateTime? scheduledEnd;
  final String? technicianId;
  final String? technicianName;
  final String? technicianColor;
  final String? technicianPhoto;
  final int stopNumber;
  final String? clientName;
  final String? address;
  final double? lat;
  final double? lng;
  final String? status;
  final List<String>? items;
  final List<String>? items_view; // Adicionar campo para items_view

  AppointmentModel({
    required this.appointmentId,
    this.scheduledStart,
    this.scheduledEnd,
    this.technicianId,
    this.technicianName,
    this.technicianColor,
    this.technicianPhoto,
    this.stopNumber = 1,
    this.clientName,
    this.address,
    this.lat,
    this.lng,
    this.status,
    this.items,
    this.items_view, // Adicionar items_view ao construtor
  });
}

class ScheduleMapWidget extends StatefulWidget {
  const ScheduleMapWidget({
    super.key,
    this.selectedDate,
    this.width,
    this.height,
    this.officeLat,
    this.officeLng,
    this.officeMarkerUrl,
    this.markerImageSize = 48.0,
    this.markerBorderSize = 4.0,
    this.mapStyleJson, // Param opcional para estilo custom
    this.showLiveTracking = false,
    this.showNewWorkOrders = true,
    this.newWorkOrderMarkerUrl,
    this.pollIntervalSeconds = 60,
  });

  /// Data para filtrar appointments do dia
  final DateTime? selectedDate;

  /// Dimensões do container
  final double? width;
  final double? height;

  /// Coordenadas e foto do office (opcional)
  final double? officeLat;
  final double? officeLng;
  final String? officeMarkerUrl;

  /// Tamanho do ícone do técnico (px)
  final double markerImageSize;

  /// Tamanho da borda do ícone
  final double markerBorderSize;

  /// (Opcional) JSON para estilo do mapa
  final String? mapStyleJson;

  final bool showLiveTracking;

  /// Se deve mostrar work orders com status "New" no mapa
  final bool showNewWorkOrders;

  /// URL personalizada para o marker de novas work orders
  final String? newWorkOrderMarkerUrl;

  /// Intervalo para verificar novas work orders em segundos
  final int pollIntervalSeconds;

  @override
  State<ScheduleMapWidget> createState() => _ScheduleMapWidgetState();
}

class _ScheduleMapWidgetState extends State<ScheduleMapWidget> {
  // Usando late with null checking para lidar com a inicialização tardia
  gmaps.GoogleMapController? _mapController;

  List<AppointmentModel> _appointments = [];
  Set<gmaps.Marker> _markers = {};

  // Cache de ícones para não ficar baixando repetidamente
  final Map<String, gmaps.BitmapDescriptor> _photoCache = {};

  // Adicione uma função para limpar o cache:
  void _clearPhotoCache() {
    if (_photoCache.length > 20) {
      _photoCache.clear();
    }
  }

  // Substitua aqui pela sua Google Directions API Key
  final String googleApiKey = 'AIzaSyB3J0Keewnq9l05Ys-93EYfLC5u29PbtWg';

  // Um estilo escuro padrão, caso você queira
  final String _defaultDarkMapStyle = '''
[
{"elementType": "geometry","stylers": [{"color": "#242f3e"}]},
{"elementType": "labels.text.fill","stylers": [{"color": "#746855"}]},
{"elementType": "labels.text.stroke","stylers": [{"color": "#242f3e"}]},
{"featureType": "administrative.land_parcel","stylers": [{"visibility": "off"}]},
{"featureType": "administrative.locality","stylers": [{"color": "#d59563"}]},
{"featureType": "poi","stylers": [{"visibility": "off"}]},
{"featureType": "poi.park","stylers": [{"color": "#263c3f"}]},
{"featureType": "road","elementType": "geometry","stylers": [{"color": "#38414e"}]},
{"featureType": "road","elementType": "geometry.stroke","stylers": [{"color": "#212a37"}]},
{"featureType": "road","elementType": "labels.text.fill","stylers": [{"color": "#9ca5b3"}]},
{"featureType": "road.highway","stylers": [{"color": "#746855"}]},
{"featureType": "road.local","stylers": [{"visibility": "off"}]},
{"featureType": "transit","stylers": [{"color": "#2f3948"}]},
{"featureType": "water","stylers": [{"color": "#17263c"}]}
]
''';

  // Timer para atualizar localização
  Timer? _locationUpdateTimer;

  // Mapa de técnicos e suas informações
  final Map<String, Map<String, dynamic>> _techniciansInfo = {};

  // Adicionar variáveis
  List<Map<String, dynamic>> _newWorkOrders = [];
  Timer? _workOrderPollingTimer;

  // Variável de controle para evitar consultas duplicadas
  bool _isCurrentlyFetching = false;

  @override
  void initState() {
    super.initState();
    _fetchAppointmentsByDate();

    // Adicionar um pequeno delay para iniciar rastreamento
    // para evitar chamadas simultâneas durante a inicialização
    if (widget.showLiveTracking) {
      Future.delayed(const Duration(seconds: 1), () {
        _initLiveTracking();
      });
    }

    // Adicionar delay para novas work orders também
    if (widget.showNewWorkOrders) {
      Future.delayed(const Duration(seconds: 2), () {
        _fetchNewWorkOrders();
        _startWorkOrderPolling();
      });
    }

    // Buscar técnicos ativos com delay
    Future.delayed(const Duration(seconds: 3), () {
      _fetchActiveTechnicians();
    });
  }

  @override
  void didUpdateWidget(covariant ScheduleMapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedDate != oldWidget.selectedDate) {
      _fetchAppointmentsByDate();
    }

    // Verificar se showLiveTracking mudou
    if (widget.showLiveTracking != oldWidget.showLiveTracking) {
      if (widget.showLiveTracking) {
        _initLiveTracking();
      } else {
        _stopLiveTracking();
      }
    }

    // Verificar se showNewWorkOrders mudou
    if (widget.showNewWorkOrders != oldWidget.showNewWorkOrders) {
      if (widget.showNewWorkOrders) {
        _fetchNewWorkOrders();
        _startWorkOrderPolling();
      } else {
        _stopWorkOrderPolling();
      }
    }
  }

  @override
  void dispose() {
    _stopLiveTracking();
    _stopWorkOrderPolling();
    super.dispose();
  }

  /// Busca os appointments do dia no Supabase
  Future<void> _fetchAppointmentsByDate() async {
    try {
      final date = widget.selectedDate ?? DateTime.now();
      final startDay = DateTime(date.year, date.month, date.day, 0, 0, 0);
      final endDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

      final response = await Supabase.instance.client
          .from('appointments')
          .select('*') // Seleciona todas as colunas
          .gte('scheduled_start', startDay.toIso8601String())
          .lte('scheduled_start', endDay.toIso8601String());

      final dataList = response as List<dynamic>;
      _appointments = dataList.map((obj) {
        final map = obj as Map<String, dynamic>;
        // Se a coluna 'items' for array, converte
        List<String>? itemList;
        if (map['items'] is List) {
          itemList = (map['items'] as List).map((e) => e.toString()).toList();
        }

        // Se a coluna 'items_view' for array, converte
        List<String>? itemsViewList;
        if (map['items_view'] is List) {
          itemsViewList =
              (map['items_view'] as List).map((e) => e.toString()).toList();
        }

        // Verificação de segurança para lat e lng
        double? lat;
        if (map['lat'] != null) {
          lat = (map['lat'] as num).toDouble();
        }

        double? lng;
        if (map['lng'] != null) {
          lng = (map['lng'] as num).toDouble();
        }

        return AppointmentModel(
          appointmentId: map['appointment_id'] ?? '',
          scheduledStart: map['scheduled_start'] != null
              ? DateTime.parse(map['scheduled_start'])
              : null,
          scheduledEnd: map['scheduled_end'] != null
              ? DateTime.parse(map['scheduled_end'])
              : null,
          technicianId: map['technician_id'],
          technicianName: map['technician_name'],
          technicianColor: map['technician_color'],
          technicianPhoto: map['technician_photo'],
          stopNumber: (map['stop_number'] ?? 1) as int,
          clientName: map['client_name'],
          address: map['address'],
          lat: lat,
          lng: lng,
          status: map['status'],
          items: itemList,
          items_view: itemsViewList,
        );
      }).toList();

      // Limpar cache de ícones quando atualizar os dados
      // Isso garante que a imagem será recarregada se for alterada
      _photoCache.clear();

      // Gera marcadores
      await _buildAllMarkers();

      if (mounted) setState(() {});

      // Centraliza
      _recenterMap();
    } catch (e) {
      debugPrint('Erro ao buscar appointments: $e');
    }
  }

  /// Constrói todos os marcadores - appointments, office e work orders
  Future<void> _buildAllMarkers() async {
    if (_mapController == null) {
      print('❌ Map controller not initialized yet, skipping marker update');
      return;
    }

    final markers = <gmaps.Marker>[];

    // 1. Adicionar marcadores de appointments
    for (final apt in _appointments) {
      if (apt.lat == null || apt.lng == null) continue;

      final icon = await _createCircularIcon(
        photoUrl: apt.technicianPhoto ?? "",
        colorHex: apt.technicianColor ?? "#FF0000",
        size: widget.markerImageSize.toInt(),
        borderSize: widget.markerBorderSize.toInt(),
      );

      markers.add(
        gmaps.Marker(
          markerId: gmaps.MarkerId(apt.appointmentId),
          position: gmaps.LatLng(apt.lat!, apt.lng!),
          icon: icon,
          infoWindow: gmaps.InfoWindow(
            title: '${apt.technicianName ?? "Tech?"} (Stop: ${apt.stopNumber})',
            snippet: apt.address ?? 'No address',
          ),
          onTap: () => _onTapMarker(apt),
        ),
      );
    }

    // 2. Adicionar marcador do escritório
    if (widget.officeLat != null && widget.officeLng != null) {
      gmaps.BitmapDescriptor icon = gmaps.BitmapDescriptor.defaultMarkerWithHue(
        gmaps.BitmapDescriptor.hueAzure,
      );

      // Se houver officeMarkerUrl, tenta criar circular icon
      if (widget.officeMarkerUrl != null &&
          widget.officeMarkerUrl!.isNotEmpty) {
        try {
          icon = await _createCircularIcon(
            photoUrl: widget.officeMarkerUrl!,
            colorHex: '#FFFFFF',
            size: 36,
            borderSize: 3,
          );
        } catch (e) {
          debugPrint('Erro ao criar ícone do office: $e');
        }
      }

      markers.add(
        gmaps.Marker(
          markerId: const gmaps.MarkerId('office_marker'),
          position: gmaps.LatLng(widget.officeLat!, widget.officeLng!),
          icon: icon,
          infoWindow: const gmaps.InfoWindow(title: 'Office'),
          zIndex: 5, // Prioridade média
        ),
      );
    }

    // 3. Adicionar marcadores de novas work orders (se habilitado)
    if (widget.showNewWorkOrders && _newWorkOrders.isNotEmpty) {
      print(
          '🧩 Construindo ${_newWorkOrders.length} marcadores para work orders');

      // Verificar se _newWorkOrders contém dados válidos
      int validMarkers = 0;
      int invalidMarkers = 0;

      // Criar ícone para work orders
      gmaps.BitmapDescriptor newWorkOrderIcon;
      try {
        newWorkOrderIcon = await _createWorkOrderMarkerIcon();
      } catch (e) {
        print('Erro ao criar ícone para work orders: $e');
        newWorkOrderIcon = gmaps.BitmapDescriptor.defaultMarkerWithHue(
            gmaps.BitmapDescriptor.hueRed);
      }

      // Adicionar cada work order como um marcador
      for (final workOrder in _newWorkOrders) {
        final workOrderId = workOrder['work_order_id']?.toString() ?? 'unknown';
        final lat = workOrder['lat'] as num?;
        final lng = workOrder['lng'] as num?;

        // Verificação mais rigorosa - ambos devem existir
        if (lat == null || lng == null) {
          print('⚠️ Work Order $workOrderId ignorada: lat=${lat}, lng=${lng}');
          invalidMarkers++;
          continue;
        }

        // Converter para double com segurança
        final latValue = lat.toDouble();
        final lngValue = lng.toDouble();

        // Obter a URL do pin diretamente da tabela work_orders
        final pinMarkerUrl = workOrder['pin_maker_url'] as String?;

        print('📌 Work Order $workOrderId using pin URL: $pinMarkerUrl');

        // Criar ícone para o marcador
        gmaps.BitmapDescriptor icon;
        try {
          if (pinMarkerUrl != null && pinMarkerUrl.isNotEmpty) {
            // Usar a URL do pin da tabela
            final resp = await http.get(Uri.parse(pinMarkerUrl));
            if (resp.statusCode == 200) {
              icon = gmaps.BitmapDescriptor.fromBytes(resp.bodyBytes);
              print(
                  '✅ Successfully loaded custom pin for Work Order $workOrderId');
            } else {
              // Fallback para o ícone padrão em caso de erro
              icon = await _createWorkOrderMarkerIcon();
              print('⚠️ Failed to load pin image, using default');
            }
          } else {
            // Se não houver URL personalizada, usar o ícone padrão
            icon = await _createWorkOrderMarkerIcon();
            print('ℹ️ No custom pin URL, using default marker');
          }
        } catch (e) {
          print('⚠️ Error creating icon for work order: $e');
          // Fallback para um ícone colorido
          icon = gmaps.BitmapDescriptor.defaultMarkerWithHue(
              gmaps.BitmapDescriptor.hueOrange);
        }

        // Criar o marcador com o ícone
        final marker = gmaps.Marker(
          markerId: gmaps.MarkerId('wo_$workOrderId'),
          position: gmaps.LatLng(latValue, lngValue),
          icon: icon,
          infoWindow: gmaps.InfoWindow(
            title: 'New Order: $workOrderId',
            snippet: workOrder['address'] ?? 'No address',
          ),
          onTap: () => _onTapWorkOrderMarker(workOrder as Map<String, dynamic>),
          zIndex: 10, // High priority
        );

        // Adicionar ao conjunto de marcadores
        markers.add(marker);
        validMarkers++;
      }

      print(
          '✅ Marcadores criados: $validMarkers válidos, $invalidMarkers inválidos');
    }

    // Atualizar o conjunto de marcadores
    if (mounted) {
      setState(() {
        _markers = markers.toSet();
      });
    }
  }

  /// Cria marcadores com foto do técnico
  Future<void> _buildMarkers() async {
    await _buildAllMarkers();
  }

  /// Cria ícone circular com borda colorida e foto
  Future<gmaps.BitmapDescriptor> _createCircularIcon({
    required String photoUrl,
    required String colorHex,
    required int size,
    required int borderSize,
  }) async {
    final cacheKey =
        'photo_${photoUrl}_color_${colorHex}_size_${size}_border_${borderSize}';
    if (_photoCache.containsKey(cacheKey)) {
      return _photoCache[cacheKey]!;
    }

// Se não tem foto, retorna defaultMarker with hue
    if (photoUrl.isEmpty) {
      final hue = _hexColorToHue(colorHex);
      return gmaps.BitmapDescriptor.defaultMarkerWithHue(hue);
    }

    try {
      // Baixa foto
      final resp = await http.get(Uri.parse(photoUrl));
      final bytes = resp.bodyBytes;

      // Decodifica
      final codec = await ui.instantiateImageCodec(
        bytes,
        targetWidth: size,
        targetHeight: size,
      );
      final frame = await codec.getNextFrame();
      final image = frame.image; // ui.Image

      final totalSize = size + (borderSize * 2);
      final paint = ui.Paint()..isAntiAlias = true;
      final borderColor = _parseColorFromHex(colorHex);

      final recorder = ui.PictureRecorder();
      final canvas = ui.Canvas(recorder);

      // Desenha borda
      final center = ui.Offset(totalSize / 2, totalSize / 2);
      paint.color = borderColor;
      canvas.drawCircle(center, totalSize / 2, paint);

      // Clipa e desenha a foto
      canvas.save();
      final clipPath = ui.Path()
        ..addOval(ui.Rect.fromCircle(center: center, radius: size / 2.0));
      canvas.clipPath(clipPath);

      final destRect = ui.Rect.fromCenter(
        center: center,
        width: size.toDouble(),
        height: size.toDouble(),
      );
      final srcRect = ui.Rect.fromLTWH(
        0,
        0,
        image.width.toDouble(),
        image.height.toDouble(),
      );
      canvas.drawImageRect(image, srcRect, destRect, paint);
      canvas.restore();

      final pic = recorder.endRecording();
      final finalImg = await pic.toImage(totalSize, totalSize);
      final data = await finalImg.toByteData(format: ui.ImageByteFormat.png);

      final icon = gmaps.BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
      _photoCache[cacheKey] = icon;
      return icon;
    } catch (e) {
      debugPrint("Erro _createCircularIcon: $e");
      // fallback
      final hue = _hexColorToHue(colorHex);
      return gmaps.BitmapDescriptor.defaultMarkerWithHue(hue);
    }
  }

  /// BottomSheet futurista para exibir informações
  void _onTapMarker(AppointmentModel apt) {
    // Cria um MarkerId para o marcador clicado
    final gmaps.MarkerId markerId = gmaps.MarkerId(apt.appointmentId);

    // Imprimir dados originais para depuração
    print('DEBUG: Original items_view type: ${apt.items_view.runtimeType}');
    print('DEBUG: Original items_view: ${apt.items_view}');

    // Lista para armazenar os itens processados
    List<Map<String, dynamic>> processedItems = [];

    if (apt.items_view != null && apt.items_view!.isNotEmpty) {
      for (String item in apt.items_view!) {
        try {
          // Processar o item diretamente sem tratamento adicional
          print('DEBUG: Processando item: $item');

          Map<String, dynamic> parsedItem;

          // Tenta primeiro interpretar como JSON normal
          try {
            parsedItem = json.decode(item);
          } catch (jsonError) {
            // Se falhar, tenta fazer parse exibindo o erro exato
            print('DEBUG: Erro no primeiro parse: $jsonError');

            // Tenta um método alternativo - remover as chaves e fazer parse manual
            // Este é um fallback extremo para quando nada mais funcionar
            final itemRegex = RegExp(
                r'brand\s*:\s*(.*?),\s*model\s*:\s*(.*?),\s*problem\s*:\s*(.*?),\s*itemName\s*:\s*(.*?),\s*location\s*:\s*(.*)');
            final match = itemRegex.firstMatch(item);

            if (match != null) {
              parsedItem = {
                'brand': match.group(1)?.replaceAll('"', '') ?? 'N/A',
                'model': match.group(2)?.replaceAll('"', '') ?? 'N/A',
                'problem': match.group(3)?.replaceAll('"', '') ?? 'N/A',
                'itemName': match.group(4)?.replaceAll('"', '') ?? 'N/A',
                'location':
                    match.group(5)?.replaceAll('"', '').replaceAll('}', '') ??
                        'N/A',
              };
            } else {
              // Se nada funcionar, cria um objeto com o item como título
              parsedItem = {
                'itemName': item,
                'brand': 'N/A',
                'model': 'N/A',
                'problem': 'N/A',
                'location': 'N/A'
              };
            }
          }

          // Adiciona o item processado
          processedItems.add(parsedItem);
          print('DEBUG: Item processado com sucesso: $parsedItem');
        } catch (e) {
          print('DEBUG: Erro ao processar: $e');
          // Último recurso - criar um objeto com valores conhecidos
          processedItems.add({
            'itemName': item,
            'brand': 'N/A',
            'model': 'N/A',
            'problem': 'N/A',
            'location': 'N/A'
          });
        }
      }
    }

    print('DEBUG: Processados ${processedItems.length} itens');
    print('DEBUG: Processed items: $processedItems');

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetCtx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          builder: (ctx2, scrollController) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF151515), Color(0xFF202020)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, -2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Technician: ${apt.technicianName ?? "???"}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyanAccent,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Stop #${apt.stopNumber}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        if (apt.clientName != null)
                          Text(
                            'Client: ${apt.clientName}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        Text(
                          'Address: ${apt.address ?? "N/A"}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          'Status: ${apt.status ?? "N/A"}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        if (apt.scheduledStart != null)
                          Text(
                            'Start: ${dateTimeFormat('jm', apt.scheduledStart)}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        if (apt.scheduledEnd != null)
                          Text(
                            'End: ${dateTimeFormat('jm', apt.scheduledEnd)}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        const SizedBox(height: 12),

                        // Seção de eletrodomésticos
                        if (processedItems.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Appliances:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyanAccent,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Renderizar cada eletrodoméstico
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: processedItems.map((appliance) {
                                  final String itemName =
                                      appliance['itemName']?.toString() ??
                                          'N/A';
                                  final String brand =
                                      appliance['brand']?.toString() ?? 'N/A';
                                  final String model =
                                      appliance['model']?.toString() ?? 'N/A';
                                  final String problem =
                                      appliance['problem']?.toString() ?? 'N/A';
                                  final String location = appliance['location']
                                              ?.toString() ==
                                          'null'
                                      ? 'N/A'
                                      : (appliance['location']?.toString() ??
                                          'N/A');

                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Colors.grey.shade800),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Nome do item em destaque
                                        Text(
                                          itemName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 6),

                                        // Detalhes em duas colunas
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Coluna da esquerda
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Brand: $brand',
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.white70)),
                                                  const SizedBox(height: 2),
                                                  Text('Problem: $problem',
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.white70)),
                                                ],
                                              ),
                                            ),
                                            // Coluna da direita
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Model: $model',
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.white70)),
                                                  const SizedBox(height: 2),
                                                  Text('Location: $location',
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.white70)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        const SizedBox(height: 16),

                        // Botões de ação
                        ElevatedButton.icon(
                          onPressed: () => _editStopNumber(apt),
                          icon: const Icon(Icons.edit, size: 18),
                          label: const Text('Edit Stop #'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Fechar o InfoWindow do marcador
                            _mapController?.hideMarkerInfoWindow(markerId);

                            // Fechar o BottomSheet
                            Navigator.pop(sheetCtx);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                          ),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      // Quando o BottomSheet fechar, também fechar o InfoWindow
      routeSettings: const RouteSettings(name: 'appointmentBottomSheet'),
    ).then((_) {
      // Fechar o InfoWindow quando o BottomSheet for fechado
      _mapController?.hideMarkerInfoWindow(markerId);
    });
  }

  /// Editar stopNumber e atualizar
  Future<void> _editStopNumber(AppointmentModel apt) async {
    final newStopNumber = await showDialog<int>(
      context: context,
      builder: (dialogCtx) {
        int tempValue = apt.stopNumber;
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: const Text(
            'Edit Stop #',
            style: TextStyle(color: Colors.cyanAccent),
          ),
          content: TextField(
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            onChanged: (val) {
              tempValue = int.tryParse(val) ?? apt.stopNumber;
            },
            decoration: const InputDecoration(
              labelText: 'New Stop Number',
              labelStyle: TextStyle(color: Colors.white70),
              hintText: 'Enter a number',
              hintStyle: TextStyle(color: Colors.white38),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyanAccent),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyanAccent, width: 2),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(dialogCtx, tempValue),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    if (newStopNumber == null || newStopNumber == apt.stopNumber) return;

    try {
      // PASSO 1: Obter a URL correspondente ao stopNumber usando a função getStopImageUrl
      String stopUrl = getStopImageUrl(newStopNumber);
      print('Using stop_url for stop_number $newStopNumber: $stopUrl');

      // PASSO 2: Atualizar o appointment com o novo stop_number e a nova technician_photo
      await Supabase.instance.client.from('appointments').update({
        'stop_number': newStopNumber,
        'technician_photo':
            stopUrl, // Atualizar a foto do técnico com a URL do stop
      }).eq('appointment_id', apt.appointmentId);

      // PASSO 3: Limpar o cache de ícones para garantir que a nova imagem seja carregada
      _photoCache.clear();

      // PASSO 4: Atualizar completamente os dados e o mapa
      await _fetchAppointmentsByDate();
      _recenterMap();

      // PASSO 5: Exibir confirmação ao usuário
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Stop number and technician photo updated successfully',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF2797FF),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      // Melhorar o tratamento de erro
      debugPrint('Error updating stop_number and technician_photo: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error updating: ${e.toString()}',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  /// Função para obter a URL da imagem com base no número do stop
  String getStopImageUrl(int stopNumber) {
// URL de fallback para caso nenhuma das opções abaixo se aplique
    final fallbackUrl =
        'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/wmlogoSupabase.png';

// Mapeamento de stop_number para URLs de imagem
    final Map<int, String> stopImageUrls = {
      0: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/wmlogoSupabase.png',
      1: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/1.png',
      2: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/2.png',
      3: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/3.png',
      4: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/4.png',
      5: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/5.png',
      6: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/6.png',
      7: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/7.png',
      8: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/8.png',
      9: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/9.png',
      10: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/10.png',
      11: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/11.png',
      12: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/12.png',
      13: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/13.png',
      14: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/14.png',
      15: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/15.png',
      16: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/16.png',
      17: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/17.png',
      18: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/18.png',
      19: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/19.png',
      20: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/20.png',
      21: 'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/21.png',
    };

// Retorna a URL correspondente ao stop_number ou a URL de fallback
    return stopImageUrls[stopNumber] ?? fallbackUrl;
  }

  /// Adiciona marker do escritório
  Future<void> _buildOfficeMarker() async {
    if (widget.officeLat == null || widget.officeLng == null) return;

    gmaps.BitmapDescriptor icon = gmaps.BitmapDescriptor.defaultMarkerWithHue(
      gmaps.BitmapDescriptor.hueAzure,
    );

// Se houver officeMarkerUrl, tenta criar circular icon
    if (widget.officeMarkerUrl != null && widget.officeMarkerUrl!.isNotEmpty) {
      try {
        icon = await _createCircularIcon(
          photoUrl: widget.officeMarkerUrl!,
          colorHex: '#FFFFFF',
          size: 36,
          borderSize: 3,
        );
      } catch (e) {
        debugPrint('Erro ao criar ícone do office: $e');
      }
    }

    final officeMarker = gmaps.Marker(
      markerId: const gmaps.MarkerId('office_marker'),
      position: gmaps.LatLng(widget.officeLat!, widget.officeLng!),
      icon: icon,
      infoWindow: const gmaps.InfoWindow(title: 'Office'),
    );

    final newSet = Set<gmaps.Marker>.from(_markers);
    newSet.add(officeMarker);
    _markers = newSet;
  }

  /// Centraliza no office ou no 1o appointment
  void _recenterMap() {
    if (_mapController == null) {
      print('❌ Map controller not initialized yet, skipping map centering');
      return;
    }

    if (widget.officeLat != null && widget.officeLng != null) {
      final officePos = gmaps.LatLng(widget.officeLat!, widget.officeLng!);
      _mapController!.animateCamera(
        gmaps.CameraUpdate.newLatLngZoom(officePos, 9.0),
      );
      return;
    }
    if (_appointments.isNotEmpty) {
      final firstWithCoords = _appointments.firstWhere(
        (a) => a.lat != null && a.lng != null,
        orElse: () => _appointments.first,
      );
      if (firstWithCoords.lat != null && firstWithCoords.lng != null) {
        final pos = gmaps.LatLng(firstWithCoords.lat!, firstWithCoords.lng!);
        _mapController!
            .animateCamera(gmaps.CameraUpdate.newLatLngZoom(pos, 9.0));
      }
    }
  }

  /// Aplica estilo no onMapCreated
  void _applyMapStyle() {
    if (_mapController == null) return;

    // Se 'mapStyleJson' foi passado, usar ele, senão usar o defaultDarkMapStyle
    final styleToUse =
        (widget.mapStyleJson != null && widget.mapStyleJson!.isNotEmpty)
            ? widget.mapStyleJson!
            : _defaultDarkMapStyle;

    _mapController!.setMapStyle(styleToUse).catchError((e) {
      debugPrint('Erro ao aplicar map style: $e');
    });
  }

  /// Auxiliares de cor
  Color _parseColorFromHex(String hexColor) {
    var hex = hexColor.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // alpha=255
    }
    return Color(int.parse(hex, radix: 16));
  }

  double _hexColorToHue(String hexColor) {
    var hex = hexColor.replaceAll('#', '');
    if (hex.length == 6) {
      final r = int.parse(hex.substring(0, 2), radix: 16);
      final g = int.parse(hex.substring(2, 4), radix: 16);
      final b = int.parse(hex.substring(4, 6), radix: 16);
      return _rgbToHue(r, g, b);
    }
    return 0.0;
  }

  double _rgbToHue(int r, int g, int b) {
    final fr = r / 255.0;
    final fg = g / 255.0;
    final fb = b / 255.0;
    final maxC = [fr, fg, fb].reduce((a, c) => a > c ? a : c);
    final minC = [fr, fg, fb].reduce((a, c) => a < c ? a : c);
    final delta = maxC - minC;
    double h = 0;
    if (delta != 0) {
      if (maxC == fr) {
        h = 60 * (((fg - fb) / delta) % 6);
      } else if (maxC == fg) {
        h = 60 * ((fb - fr) / delta + 2);
      } else {
        h = 60 * ((fr - fg) / delta + 4);
      }
    }
    if (h < 0) h += 360;
    return h;
  }

// Iniciar rastreamento em tempo real
  void _initLiveTracking() async {
    // Versão simplificada para evitar dependências
    try {
      // Verificar permissão
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      // Configurar timer para atualizar a cada 60 segundos (ao invés de 30)
      // para reduzir atualizações frequentes
      _locationUpdateTimer = Timer.periodic(
        const Duration(seconds: 60),
        (timer) => _updateTechnicianLocations(),
      );
    } catch (e) {
      debugPrint('Erro ao iniciar rastreamento: $e');
    }
  }

  void _stopLiveTracking() {
    _locationUpdateTimer?.cancel();
    _locationUpdateTimer = null;

// Simplificado
    FFAppState().update(() {
      FFAppState().locationTrackingState = false;
    });
  }

// Atualizar localizações dos técnicos
  Future<void> _updateTechnicianLocations() async {
    try {
      await _updateCurrentLocationMarkerWithPhoto();
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint('Erro ao atualizar localizações: $e');
    }
  }

// Obter foto do usuário e atualizar marcador com ela
  Future<void> _getUserPhotoAndUpdateMarker() async {
    await _updateCurrentLocationMarkerWithPhoto();
  }

// ADICIONE este método DENTRO da classe
  Future<void> _fetchActiveTechnicians() async {
    try {
      // Buscar localizações de técnicos ativos (com dados recentes)
      final DateTime twoHoursAgo =
          DateTime.now().subtract(const Duration(hours: 2));

      final response = await Supabase.instance.client
          .from('technician_locations')
          .select(
              '*, users!inner(user_photo, user_id, role, full_name, technician_color)')
          .gt('updated_at', twoHoursAgo.toIso8601String())
          .eq('users.role', 'technician');

      print('Técnicos ativos encontrados: ${response.length}');

      if (response != null && response is List && response.isNotEmpty) {
        final Set<gmaps.Marker> newMarkers = Set<gmaps.Marker>.from(_markers);

        for (final techLocation in response) {
          // Pular se não tiver dados completos
          if (!techLocation.containsKey('latitude') ||
              !techLocation.containsKey('longitude') ||
              !techLocation.containsKey('users')) {
            continue;
          }

          final userData = techLocation['users'] as Map<String, dynamic>;
          final photoUrl = userData['user_photo'] as String?;
          final technicianId = techLocation['technician_id'] as String;
          final technicianName = userData['full_name'] as String?;

          // Obter a cor específica do técnico
          final techColor =
              userData['technician_color'] as String? ?? "#4285F4";
          print('Técnico: $technicianName, Cor: $techColor');

          // Criar ícone personalizado para o técnico COM A COR ESPECÍFICA
          final icon = await _createCircularIcon(
            photoUrl: photoUrl ?? "",
            colorHex: techColor, // Usar a cor específica do técnico
            size: 30,
            borderSize: 2,
          );

          // Criar marcador para o técnico
          final techMarker = gmaps.Marker(
            markerId: gmaps.MarkerId('tech_$technicianId'),
            position: gmaps.LatLng(
              (techLocation['latitude'] as num).toDouble(),
              (techLocation['longitude'] as num).toDouble(),
            ),
            icon: icon,
            infoWindow: gmaps.InfoWindow(
              title: technicianName ?? 'Técnico',
              snippet: 'Última atualização: ${techLocation['updated_at']}',
            ),
          );

          // Adicionar ao conjunto de marcadores
          newMarkers.add(techMarker);
        }

        // Atualizar todos os marcadores de uma vez
        setState(() {
          _markers = newMarkers;
        });
      }
    } catch (e) {
      print('Erro ao buscar técnicos ativos: $e');
    }
  }

// REMOVA a implementação existente de _updateCurrentLocationMarkerWithPhoto se houver
// e ADICIONE este método DENTRO da classe
  Future<void> _updateCurrentLocationMarkerWithPhoto() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      final currentUser = Supabase.instance.client.auth.currentUser;

      if (currentUser == null) return;

      // Buscar a cor do técnico no banco de dados
      final userResponse = await Supabase.instance.client
          .from('users')
          .select('user_photo, technician_color')
          .eq('user_id', currentUser.id)
          .single();

      final photoUrl = userResponse['user_photo'] as String?;
      final techColor =
          userResponse['technician_color'] as String? ?? "#4285F4";

      print('Cor do técnico para localização atual: $techColor');

      // Criar o ícone com a cor específica do técnico
      final icon = await _createCircularIcon(
        photoUrl: photoUrl ?? "",
        colorHex: techColor,
        size: widget.markerImageSize.toInt(),
        borderSize: widget.markerBorderSize.toInt(),
      );

      // Atualizar a localização no estado da aplicação
      FFAppState().update(() {
        FFAppState().currentLocation = LatLng(
          position.latitude,
          position.longitude,
        );
      });

      // Salvar no banco de dados
      await Supabase.instance.client.from('technician_locations').upsert({
        'technician_id': currentUser.id,
        'latitude': position.latitude,
        'longitude': position.longitude,
        'accuracy': position.accuracy,
        'speed': position.speed,
      }, onConflict: 'technician_id');

      // Criar marcador com a cor correta
      final currentLocationMarker = gmaps.Marker(
        markerId: const gmaps.MarkerId('current_location'),
        position: gmaps.LatLng(position.latitude, position.longitude),
        icon: icon,
        infoWindow: const gmaps.InfoWindow(
          title: 'Minha localização atual',
          snippet: 'Você está aqui',
        ),
        zIndex: 10,
      );

      // Atualizar marcadores
      final newMarkers = Set<gmaps.Marker>.from(_markers);
      newMarkers.removeWhere(
        (marker) => marker.markerId == const gmaps.MarkerId('current_location'),
      );
      newMarkers.add(currentLocationMarker);

      setState(() {
        _markers = newMarkers;
      });
    } catch (e) {
      print('Erro ao atualizar marcador de localização: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double initLat = 37.7749;
    double initLng = -122.4194;

// Ajusta lat/lng inicial
    if (_appointments.isNotEmpty) {
      final firstWithCoords = _appointments.firstWhere(
        (a) => a.lat != null && a.lng != null,
        orElse: () => _appointments.first,
      );
      if (firstWithCoords.lat != null && firstWithCoords.lng != null) {
        initLat = firstWithCoords.lat!;
        initLng = firstWithCoords.lng!;
      }
    } else if (widget.officeLat != null && widget.officeLng != null) {
      initLat = widget.officeLat!;
      initLng = widget.officeLng!;
    } else if (FFAppState().currentLocation != null) {
      // Usar localização atual se disponível
      initLat = FFAppState().currentLocation!.latitude;
      initLng = FFAppState().currentLocation!.longitude;
    }

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 500,
      child: Stack(
        children: [
          // Mapa Google - SEM GESTURERECOGNIZER
          ClipRRect(
            // Usar ClipRRect para capturar eventos internamente
            borderRadius: BorderRadius.circular(0),
            child: GestureDetector(
              // Usar GestureDetector simples
              behavior: HitTestBehavior.opaque, // Impede propagação
              child: gmaps.GoogleMap(
                onMapCreated: (controller) {
                  _mapController = controller;
                  _applyMapStyle();

                  if (widget.showLiveTracking &&
                      FFAppState().currentLocation != null) {
                    _getUserPhotoAndUpdateMarker();
                  }
                },
                initialCameraPosition: gmaps.CameraPosition(
                  target: gmaps.LatLng(initLat, initLng),
                  zoom: 9.0,
                ),
                markers: _markers,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                // Habilitar todos os gestos do mapa
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                scrollGesturesEnabled: true,
                rotateGesturesEnabled: true,
                tiltGesturesEnabled: true,
              ),
            ),
          ),

          // Botão para ligar/desligar rastreamento na parte superior
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: _toggleLiveTracking,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          FFAppState().locationTrackingState
                              ? Icons.location_on
                              : Icons.location_off,
                          color: FFAppState().locationTrackingState
                              ? const Color(0xFF2797FF)
                              : Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          FFAppState().locationTrackingState
                              ? 'Active Tracking'
                              : 'Enable Tracking',
                          style: TextStyle(
                            color: FFAppState().locationTrackingState
                                ? const Color(0xFF2797FF)
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Botões flutuantes à esquerda
          Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Botão recenter (Casa)
                FloatingActionButton(
                  onPressed: _recenterMap,
                  tooltip: 'Center Map',
                  backgroundColor: const Color(0xFF2797FF),
                  child: const Icon(Icons.home),
                ),

                const SizedBox(height: 8),

                // Botão para atualizar técnicos
                FloatingActionButton(
                  onPressed: () {
                    _fetchActiveTechnicians();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Updating active technicians...',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Color(0xFF2797FF),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  tooltip: 'Update Technicians',
                  backgroundColor: const Color(0xFF2797FF),
                  child: const Icon(Icons.people),
                ),

                const SizedBox(height: 8),

                // Botão para buscar novas ordens de trabalho
                FloatingActionButton(
                  onPressed: () {
                    _manualFetchNewWorkOrders();
                  },
                  tooltip: 'Find New Orders',
                  backgroundColor: const Color(0xFF2797FF),
                  child: const Icon(Icons.work),
                ),

                const SizedBox(height: 8),

                // Botão para centralizar nos marcadores existentes
                FloatingActionButton(
                  onPressed: () => _focusOnWorkOrderMarkers(),
                  tooltip: 'Show All Orders',
                  backgroundColor: const Color(0xFF2797FF),
                  child: const Icon(Icons.center_focus_strong),
                ),

                // Espaço condicional e botão para rastreamento se necessário
                if (widget.showLiveTracking &&
                    FFAppState().locationTrackingState)
                  const SizedBox(height: 8),

                if (widget.showLiveTracking &&
                    FFAppState().locationTrackingState)
                  FloatingActionButton(
                    onPressed: _updateTechnicianLocations,
                    tooltip: 'Update Location',
                    backgroundColor: const Color(0xFF2797FF),
                    child: const Icon(Icons.my_location),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Método para alternar entre ligar e desligar o rastreamento
  void _toggleLiveTracking() {
    final newState = !FFAppState().locationTrackingState;

    setState(() {
      FFAppState().update(() {
        FFAppState().locationTrackingState = newState;
      });
    });

    if (newState) {
      // Se estiver ligando o rastreamento
      _initLiveTracking();
      _updateTechnicianLocations(); // Atualizar imediatamente
    } else {
      // Se estiver desligando o rastreamento
      _stopLiveTracking();

      // Remover o marcador de localização atual
      final newMarkers = Set<gmaps.Marker>.from(_markers);
      newMarkers.removeWhere(
        (marker) => marker.markerId == const gmaps.MarkerId('current_location'),
      );
      setState(() {
        _markers = newMarkers;
      });
    }
  }

// Iniciar polling de novas work orders
  void _startWorkOrderPolling() {
    _workOrderPollingTimer?.cancel();
    // Aumentar o intervalo para 3 minutos (180 segundos) para reduzir atualizações excessivas
    _workOrderPollingTimer = Timer.periodic(
      const Duration(seconds: 180),
      (_) => _fetchNewWorkOrders(),
    );
  }

// Parar polling de novas work orders
  void _stopWorkOrderPolling() {
    _workOrderPollingTimer?.cancel();
    _workOrderPollingTimer = null;
  }

// Modificar o método que carrega pins diretamente da URL para redimensionar para 36px
  Future<gmaps.BitmapDescriptor> _loadPinFromUrl(String url) async {
    try {
      print('🖼️ Loading pin image from: $url');
      final resp = await http.get(Uri.parse(url));

      if (resp.statusCode == 200) {
        final bytes = resp.bodyBytes;

        // Sempre redimensionar para 36px para manter consistência
        if (kIsWeb) {
          // Para web, usar bytes diretos (a plataforma web lida com o redimensionamento)
          return gmaps.BitmapDescriptor.fromBytes(bytes);
        } else {
          // Para mobile, redimensionar explicitamente
          final codec = await ui.instantiateImageCodec(
            bytes,
            targetWidth: 36,
            targetHeight: 36,
          );
          final frame = await codec.getNextFrame();
          final image = frame.image;

          final data = await image.toByteData(format: ui.ImageByteFormat.png);
          return gmaps.BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
        }
      } else {
        print(
            '⚠️ Failed to load image from URL: $url (Status: ${resp.statusCode})');
        throw Exception('Failed to load image');
      }
    } catch (e) {
      print('❌ Error loading image: $e');
      throw e;
    }
  }

// Modificar o método _fetchNewWorkOrders para usar o novo método de carregamento
  Future<void> _fetchNewWorkOrders() async {
    try {
      print('🔍 Searching for new work orders...');

// Buscar ordens com status "New"
      final response = await Supabase.instance.client
          .from('work_orders')
          .select('*')
          .eq('work_order_status', 'New')
          .limit(20);

      print('🔢 Found ${response.length} orders with status "New"');

      if (response is List && response.isNotEmpty) {
        // Criar um conjunto de marcadores a partir do conjunto atual
        final Set<gmaps.Marker> newMarkers = Set<gmaps.Marker>.from(_markers);

        // Remover marcadores antigos de work orders
        newMarkers.removeWhere(
          (marker) => marker.markerId.value.startsWith('wo_'),
        );

        // Variável para acompanhar quantos marcadores válidos foram criados
        int validMarkers = 0;

        for (final workOrder in response) {
          // Garantir que temos dados válidos
          if (!workOrder.containsKey('lat') ||
              !workOrder.containsKey('lng') ||
              workOrder['lat'] == null ||
              workOrder['lng'] == null) {
            print(
                '⚠️ Work Order ${workOrder['work_order_id']} ignored: invalid coordinates');
            continue;
          }

          final workOrderId =
              workOrder['work_order_id']?.toString() ?? 'unknown';
          final lat = (workOrder['lat'] as num).toDouble();
          final lng = (workOrder['lng'] as num).toDouble();

          // Obter a URL do pin diretamente da tabela work_orders
          final pinMarkerUrl = workOrder['pin_maker_url'] as String?;

          print('📌 Work Order $workOrderId using pin URL: $pinMarkerUrl');

          // Criar ícone para o marcador - sempre com tamanho 36px
          gmaps.BitmapDescriptor icon;
          try {
            if (pinMarkerUrl != null && pinMarkerUrl.isNotEmpty) {
              // Usar a URL do pin da tabela com redimensionamento
              icon = await _loadPinFromUrl(pinMarkerUrl);
              print(
                  '✅ Successfully loaded custom pin for Work Order $workOrderId');
            } else {
              // Se não houver URL personalizada, usar o ícone padrão
              icon = await _createWorkOrderMarkerIcon();
              print('ℹ️ No custom pin URL, using default marker');
            }
          } catch (e) {
            print('⚠️ Error creating icon for work order: $e');
            // Fallback para um ícone colorido
            icon = gmaps.BitmapDescriptor.defaultMarkerWithHue(
                gmaps.BitmapDescriptor.hueOrange);
          }

          // Criar o marcador com o ícone
          final marker = gmaps.Marker(
            markerId: gmaps.MarkerId('wo_$workOrderId'),
            position: gmaps.LatLng(lat, lng),
            icon: icon,
            infoWindow: gmaps.InfoWindow(
              title: 'New Order: $workOrderId',
              snippet: workOrder['address'] ?? 'No address',
            ),
            onTap: () =>
                _onTapWorkOrderMarker(workOrder as Map<String, dynamic>),
            zIndex: 10, // High priority
          );

          // Adicionar ao conjunto de marcadores
          newMarkers.add(marker);
          validMarkers++;
        }

        // Atualizar o estado com os novos marcadores
        setState(() {
          _markers = newMarkers;
          _newWorkOrders =
              response.map((item) => item as Map<String, dynamic>).toList();
        });

        print('✅ Added $validMarkers new work order markers to the map');

        // Se marcadores foram adicionados, centralizar o mapa neles
        if (validMarkers > 0) {
          _focusOnWorkOrderMarkers();
        }

        // Mostrar feedback ao usuário
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Found $validMarkers new work orders',
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } else {
        print('⚠️ No work orders found with status "New"');

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'No new work orders found',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } catch (e) {
      print('❌ ERROR fetching work orders: $e');
      print('Stack trace: ${StackTrace.current}');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error fetching orders: $e',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

// Atualize também o método _createWorkOrderMarkerIcon para garantir consistência
  Future<gmaps.BitmapDescriptor> _createWorkOrderMarkerIcon() async {
// Simplificar para web
    if (kIsWeb) {
      return gmaps.BitmapDescriptor.defaultMarkerWithHue(
          gmaps.BitmapDescriptor.hueGreen);
    }

// Código existente para Mobile...
    try {
      final String markerUrl = widget.newWorkOrderMarkerUrl ??
          'https://api.wmappliances.cloud/storage/v1/object/public/photos/stopNumbers/pinNewJob.png';

      print('🖼️ Trying to download icon from: $markerUrl');

      // Usar o método compartilhado para garantir consistência no tamanho
      try {
        return await _loadPinFromUrl(markerUrl);
      } catch (e) {
        print('⚠️ Error loading default marker: $e');
        return gmaps.BitmapDescriptor.defaultMarkerWithHue(
            gmaps.BitmapDescriptor.hueGreen);
      }
    } catch (e) {
      return gmaps.BitmapDescriptor.defaultMarkerWithHue(
          gmaps.BitmapDescriptor.hueGreen);
    }
  }

// Adicionar uma verificação no método didChangeDependencies
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('🔄 didChangeDependencies chamado');
    print('🔧 showNewWorkOrders = ${widget.showNewWorkOrders}');

// Forçar verificação
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && _mapController != null) {
        print('🔄 Atualizando dados após delay...');
        _fetchNewWorkOrders();

        // Garantir que o marcador do escritório seja adicionado
        if (widget.officeLat != null && widget.officeLng != null) {
          print('🏢 Forçando adição do marcador do escritório');
          _buildOfficeMarker();
        }
      }
    });
  }

// Adicionar este método para lidar com taps em work orders
  void _onTapWorkOrderMarker(Map<String, dynamic> workOrder) {
    // Chamar a implementação existente
    onTapWorkOrderMarker(workOrder);
  }

// Adicionar este método para lidar com taps em work orders
  void onTapWorkOrderMarker(Map<String, dynamic> workOrder) {
    final gmaps.MarkerId markerId =
        gmaps.MarkerId('wo_${workOrder['work_order_id']}');

    // Exibir bottom sheet com informações da work order
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetCtx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          builder: (ctx2, scrollController) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF151515), Color(0xFF202020)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, -2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New Work Order',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'ID: ${workOrder['work_order_id'] ?? "N/A"}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        if (workOrder['customer_name'] != null)
                          Text(
                            'Customer: ${workOrder['customer_name']}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        Text(
                          'Address: ${workOrder['address'] ?? "N/A"}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          'Status: ${workOrder['work_order_status'] ?? "N/A"}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        if (workOrder['customer_phone'] != null)
                          Text(
                            'Phone: ${workOrder['customer_phone']}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        const SizedBox(height: 12),

                        // Seção de Appliances
                        if (workOrder['items'] != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Appliances:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Usar o método melhorado para exibir os eletrodomésticos
                              _buildAppliancesList(workOrder['items']),
                            ],
                          ),
                        const SizedBox(height: 16),

                        // Botão para navegar para a página de work order
                        ElevatedButton.icon(
                          onPressed: () {
                            // Fechar o bottomsheet
                            Navigator.pop(sheetCtx);

                            // Navegar para a página workOrder com apenas o workOrderId como parâmetro
                            context.pushNamed(
                              'workOrder',
                              queryParameters: {
                                'workOrderId':
                                    workOrder['work_order_id']?.toString() ??
                                        '',
                              },
                            );
                          },
                          icon: const Icon(Icons.assignment, size: 18),
                          label: const Text('Order Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Fechar o InfoWindow do marcador
                            _mapController?.hideMarkerInfoWindow(markerId);

                            // Fechar o BottomSheet
                            Navigator.pop(sheetCtx);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                          ),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      // Quando o BottomSheet fechar, também fechar o InfoWindow
      routeSettings: const RouteSettings(name: 'workOrderBottomSheet'),
    ).then((_) {
      // Fechar o InfoWindow quando o BottomSheet for fechado
      _mapController?.hideMarkerInfoWindow(markerId);
    });
  }

// Método para centralizar nos marcadores também traduzido
  void _focusOnWorkOrderMarkers() {
    if (_mapController == null || _newWorkOrders.isEmpty) return;

    // Criar bounds para incluir todos os marcadores de work orders
    List<gmaps.LatLng> points = [];

    for (final wo in _newWorkOrders) {
      final lat = wo['lat'] as num?;
      final lng = wo['lng'] as num?;

      if (lat != null && lng != null) {
        points.add(gmaps.LatLng(lat.toDouble(), lng.toDouble()));
      }
    }

    if (points.isEmpty) return;

    // Encontrar os limites (bounds)
    double minLat = points.first.latitude;
    double maxLat = points.first.latitude;
    double minLng = points.first.longitude;
    double maxLng = points.first.longitude;

    for (final point in points) {
      minLat = min(minLat, point.latitude);
      maxLat = max(maxLat, point.latitude);
      minLng = min(minLng, point.longitude);
      maxLng = max(maxLng, point.longitude);
    }

    // Adicionar padding
    final bounds = gmaps.LatLngBounds(
      southwest: gmaps.LatLng(minLat - 0.05, minLng - 0.05),
      northeast: gmaps.LatLng(maxLat + 0.05, maxLng + 0.05),
    );

    // Animar o mapa para mostrar todas as work orders
    _mapController!.animateCamera(
      gmaps.CameraUpdate.newLatLngBounds(bounds, 50.0),
    );
  }

// Método para busca manual com feedback visual
  Future<void> _manualFetchNewWorkOrders() async {
// Evitar consultas duplicadas
    if (_isCurrentlyFetching) return;
    _isCurrentlyFetching = true;

    try {
      // Removido: SnackBar de busca

      // Realizar consulta explícita à tabela work_orders
      final response = await Supabase.instance.client
          .from('work_orders')
          .select('*')
          .eq('work_order_status', 'New')
          .limit(20);

      // Exibir resultados em diálogo
      if (!mounted) return;

      if (response is List && response.isNotEmpty) {
        setState(() {
          _newWorkOrders =
              response.map((item) => item as Map<String, dynamic>).toList();

          print('Work orders saved locally: ${_newWorkOrders.length}');
        });

        // Log detalhado para depuração
        print('📍 Data received for markers:');
        for (final wo in _newWorkOrders) {
          print(
              '  - ${wo['work_order_id']}: lat=${wo['lat']}, lng=${wo['lng']}, pin_url=${wo['pin_maker_url']}');
        }

        // Reconstruir marcadores para mostrar as novas work orders
        await _buildAllMarkers();

        // Centralizar o mapa na localização da primeira work order
        if (_newWorkOrders.isNotEmpty) {
          _focusOnWorkOrderMarkers();
        }

        // Removido: SnackBar de sucesso
      } else {
        // Removido: SnackBar de não encontrado
      }
    } catch (e) {
      // Removido: SnackBar de erro
      print('❌ ERROR fetching work orders: $e');
    } finally {
      _isCurrentlyFetching = false;
    }
  }

// Método auxiliar para construir a lista de appliances
  Widget _buildAppliancesList(dynamic appliances) {
    try {
      // Verificar entrada vazia
      if (appliances == null) {
        return const Text('No appliances found',
            style: const TextStyle(color: Colors.white));
      }

      // Converter para lista de Map<String, dynamic>
      List<Map<String, dynamic>> appliancesList = [];

      if (appliances is List) {
        // Processar cada item da lista
        for (var item in appliances) {
          if (item is Map<String, dynamic>) {
            // Já é um mapa, adicionar diretamente
            appliancesList.add(item);
          } else if (item is String) {
            // Processar string JSON
            try {
              // Remover aspas extras se necessário e tentar várias abordagens
              String processedString = item;

              // Registrar o formato original para debug
              print('Original JSON string: $item');

              // Verificar se tem aspas extras no início e fim
              if (item.startsWith('"') && item.endsWith('"')) {
                processedString = item.substring(1, item.length - 1);
                print('Removed outer quotes: $processedString');
              }

              // Remover escapes de aspas extras
              if (processedString.contains('\\\"')) {
                processedString = processedString.replaceAll('\\\"', '\"');
                print('Replaced \\\" with \": $processedString');
              }

              // Remover escapes duplos
              if (processedString.contains('\\\\')) {
                processedString = processedString.replaceAll('\\\\', '\\');
                print('Replaced \\\\ with \\: $processedString');
              }

              // Tentar decodificar o JSON
              try {
                final decoded = json.decode(processedString);
                if (decoded is Map<String, dynamic>) {
                  appliancesList.add(decoded);
                  print('Successfully decoded as JSON object');
                } else {
                  // Se não for um mapa, tentar decodificar novamente se for string
                  if (decoded is String) {
                    try {
                      final innerDecoded = json.decode(decoded);
                      if (innerDecoded is Map<String, dynamic>) {
                        appliancesList.add(innerDecoded);
                        print('Successfully decoded inner JSON string');
                      } else {
                        appliancesList.add({'itemName': item});
                      }
                    } catch (e) {
                      print('Failed to parse inner JSON: $e');
                      appliancesList.add({'itemName': item});
                    }
                  } else {
                    appliancesList.add({'itemName': item});
                  }
                }
              } catch (e) {
                print('Failed to parse JSON after cleaning: $e');

                // Tentar extrair com regex como último recurso
                final regex = RegExp(
                    r'"brand":\s*"([^"]*)".*?"model":\s*"([^"]*)".*?"problem":\s*"([^"]*)".*?"itemName":\s*"([^"]*)".*?"location":\s*([^,}]*)');
                final match = regex.firstMatch(processedString);
                if (match != null) {
                  final brand = match.group(1) ?? 'N/A';
                  final model = match.group(2) ?? 'N/A';
                  final problem = match.group(3) ?? 'N/A';
                  final itemName = match.group(4) ?? 'N/A';
                  final location = match.group(5)?.trim() == 'null'
                      ? 'N/A'
                      : (match.group(5) ?? 'N/A');

                  print('Extracted using regex: brand=$brand, model=$model');
                  appliancesList.add({
                    'brand': brand,
                    'model': model,
                    'problem': problem,
                    'itemName': itemName,
                    'location': location,
                  });
                } else {
                  appliancesList.add({'itemName': item});
                }
              }
            } catch (e) {
              print('Error processing string: $e');
              appliancesList.add({'itemName': item});
            }
          } else {
            // Outro tipo, usar toString()
            appliancesList.add({'itemName': item.toString()});
          }
        }
      } else if (appliances is Map<String, dynamic>) {
        // Um único mapa
        appliancesList.add(appliances);
      } else if (appliances is String) {
        // Tentar processar uma string única
        try {
          final decoded = json.decode(appliances);
          if (decoded is List) {
            // É uma lista JSON
            for (var item in decoded) {
              if (item is Map<String, dynamic>) {
                appliancesList.add(item);
              } else {
                appliancesList.add({'itemName': item.toString()});
              }
            }
          } else if (decoded is Map<String, dynamic>) {
            // É um objeto JSON único
            appliancesList.add(decoded);
          } else {
            appliancesList.add({'itemName': appliances});
          }
        } catch (e) {
          // Não é JSON válido
          appliancesList.add({'itemName': appliances});
        }
      } else {
        // Tipo desconhecido
        return Text('Error processing appliance list: unexpected format',
            style: const TextStyle(color: Colors.red));
      }

      // Se não tiver aparelhos
      if (appliancesList.isEmpty) {
        return const Text('No appliances found',
            style: const TextStyle(color: Colors.white));
      }

      // Construir a UI
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: appliancesList.map((appliance) {
          // Extrair valores com fallbacks
          final String itemName = appliance['itemName']?.toString() ?? 'N/A';
          final String brand = appliance['brand']?.toString() ?? 'N/A';
          final String model = appliance['model']?.toString() ?? 'N/A';
          final String problem = appliance['problem']?.toString() ?? 'N/A';
          final String location = appliance['location']?.toString() == 'null'
              ? 'N/A'
              : (appliance['location']?.toString() ?? 'N/A');

          // Card do aparelho
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade800),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nome do item em destaque
                Text(
                  itemName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),

                // Detalhes em duas colunas
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Coluna da esquerda
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Brand: $brand',
                              style: const TextStyle(color: Colors.white70)),
                          const SizedBox(height: 2),
                          Text('Problem: $problem',
                              style: const TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                    // Coluna da direita
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Model: $model',
                              style: const TextStyle(color: Colors.white70)),
                          const SizedBox(height: 2),
                          Text('Location: $location',
                              style: const TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      );
    } catch (e) {
      print('Error in _buildAppliancesList: $e');
      return Text('Error processing appliance list: $e',
          style: const TextStyle(color: Colors.red));
    }
  }

// Método para processar strings JSON em diferentes formatos
  Map<String, dynamic> _processJsonString(String item) {
    try {
      // Registrar o formato original para debug
      print('Original JSON string: $item');

      // Remover aspas extras se necessário e tentar várias abordagens
      String processedString = item;

      // Verificar se tem aspas extras no início e fim
      if (item.startsWith('"') && item.endsWith('"')) {
        processedString = item.substring(1, item.length - 1);
        print('Removed outer quotes: $processedString');
      }

      // Remover escapes de aspas extras
      if (processedString.contains('\\\"')) {
        processedString = processedString.replaceAll('\\\"', '\"');
        print('Replaced \\\" with \": $processedString');
      }

      // Remover escapes duplos
      if (processedString.contains('\\\\')) {
        processedString = processedString.replaceAll('\\\\', '\\');
        print('Replaced \\\\ with \\: $processedString');
      }

      // Tentar decodificar o JSON
      try {
        final decoded = json.decode(processedString);
        if (decoded is Map<String, dynamic>) {
          print('Successfully decoded as JSON object');
          return decoded;
        } else {
          // Se não for um mapa, tentar decodificar novamente se for string
          if (decoded is String) {
            try {
              final innerDecoded = json.decode(decoded);
              if (innerDecoded is Map<String, dynamic>) {
                print('Successfully decoded inner JSON string');
                return innerDecoded;
              }
            } catch (e) {
              print('Failed to parse inner JSON: $e');
              return {'itemName': item};
            }
          }
        }
      } catch (e) {
        print('Failed to parse JSON after cleaning: $e');

        // Última tentativa: usar regex para extrair campos
        final regex = RegExp(
            r'"brand":\s*"([^"]*)".*?"model":\s*"([^"]*)".*?"problem":\s*"([^"]*)".*?"itemName":\s*"([^"]*)".*?"location":\s*([^,}]*)');
        final match = regex.firstMatch(processedString);
        if (match != null) {
          final brand = match.group(1) ?? 'N/A';
          final model = match.group(2) ?? 'N/A';
          final problem = match.group(3) ?? 'N/A';
          final itemName = match.group(4) ?? 'N/A';
          final location = match.group(5)?.trim() == 'null'
              ? 'N/A'
              : (match.group(5) ?? 'N/A');

          print('Extracted using regex: brand=$brand, model=$model');
          return {
            'brand': brand,
            'model': model,
            'problem': problem,
            'itemName': itemName,
            'location': location,
          };
        }
      }

      // Fallback se tudo falhar
      return {'itemName': item};
    } catch (e) {
      print('Error processing string: $e');
      return {'itemName': item};
    }
  }
}

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

Future<bool> updateCurrentLocation() async {
  try {
// Verificar se o serviço de localização está ativo
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

// Obter localização atual
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

// Atualizar no AppState
    FFAppState().update(() {
      FFAppState().currentLocation = LatLng(
        position.latitude,
        position.longitude,
      );
    });

// Opcional: Atualizar na base de dados
    if (FFAppState().locationTrackingState) {
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
    }

    return true;
  } catch (e) {
    print('Erro ao atualizar localização: $e');
    return false;
  }
}

// Criar ícone personalizado para localização atual
Future<gmaps.BitmapDescriptor> _createCurrentLocationIcon({
  int size = 80,
  int innerCircleSize = 40,
  Color? color,
}) async {
// Usar ícone padrão na compilação web para reduzir complexidade
  if (kIsWeb) {
    return gmaps.BitmapDescriptor.defaultMarkerWithHue(
        color != null ? _colorToHue(color) : gmaps.BitmapDescriptor.hueAzure);
  }

// Implementação existente para outras plataformas
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  final paint = ui.Paint()..isAntiAlias = true;

  paint.color = color ?? Colors.white;
  canvas.drawCircle(
    ui.Offset(size / 2, size / 2),
    size / 2,
    paint,
  );

  paint.color = color != null
      ? HSLColor.fromColor(color).withLightness(0.3).toColor()
      : Colors.blue.shade700;
  canvas.drawCircle(
    ui.Offset(size / 2, size / 2),
    innerCircleSize / 2,
    paint,
  );

  paint.color = Colors.white;
  canvas.drawCircle(
    ui.Offset(size / 2, size / 2),
    innerCircleSize / 6,
    paint,
  );

  final picture = recorder.endRecording();
  final img = await picture.toImage(size, size);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  return gmaps.BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}

// Adicionar esta função auxiliar para converter cor para hue
double _colorToHue(Color color) {
  final hslColor = HSLColor.fromColor(color);
  return hslColor.hue;
}
