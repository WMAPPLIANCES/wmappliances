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

import 'package:intl/intl.dart';

class DispatchViewMapToday extends StatefulWidget {
  const DispatchViewMapToday({
    super.key,
    this.width,
    this.height,
    required this.technicianImage,
    required this.technicianName,
    required this.technicianColor,
    required this.workOrderId,
    required this.address,
    required this.stopNumber,
    required this.eventType,
    required this.startTime,
    required this.endTime,
  });

  final double? width;
  final double? height;
  final String technicianImage;
  final String technicianName;
  final String technicianColor;
  final String workOrderId;
  final String address;
  final int stopNumber;
  final String eventType;
  final DateTime startTime;
  final DateTime endTime;

  @override
  State<DispatchViewMapToday> createState() => _DispatchViewMapTodayState();
}

class _DispatchViewMapTodayState extends State<DispatchViewMapToday> {
  @override
  Widget build(BuildContext context) {
    // Converter a cor do técnico
    final Color techColor = widget.technicianColor.isNotEmpty
        ? HexColor(widget.technicianColor)
        : Colors.blue;

    return Container(
      width: widget.width,
      height: 80, // Altura reduzida para maior compactação
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2532),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: techColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto do técnico
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: techColor,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: widget.technicianImage.isNotEmpty
                    ? Image.network(
                        widget.technicianImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.person, size: 24, color: techColor),
                      )
                    : Icon(Icons.person, size: 24, color: techColor),
              ),
            ),

            const SizedBox(width: 10),

            // Coluna principal com informações
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Linha superior: nome do técnico e stop number
                  Row(
                    children: [
                      // Nome do técnico com tamanho reduzido
                      Text(
                        widget.technicianName,
                        style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                              fontWeight: FontWeight.bold,
                              color: techColor,
                              fontSize: 16, // Fonte ainda menor
                            ),
                      ),
                      const SizedBox(width: 6),
                      // Badge do Stop dentro da mesma linha do nome
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: techColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: techColor.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Stop #${widget.stopNumber}',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9,
                                  ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 3),

                  // Endereço com ícone para economizar espaço
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.address,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.copyWith(
                                    color: Colors.white70,
                                    fontSize: 10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // ID do Pedido apenas (horário foi movido para a direita)
                  Row(
                    children: [
                      Icon(
                        Icons.work_outline,
                        size: 12,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'ID: ${widget.workOrderId}',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.copyWith(
                                    color: Colors.white70,
                                    fontSize: 10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Coluna para horário e tipo de evento
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Horário acima do badge de evento
                Container(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    '${DateFormat('HH:mm').format(widget.startTime)}-${DateFormat('HH:mm').format(widget.endTime)}',
                    style: FlutterFlowTheme.of(context).bodySmall.copyWith(
                          color: Colors.white70,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),

                // Badge de tipo de evento
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getEventTypeColor(widget.eventType),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    widget.eventType,
                    style: FlutterFlowTheme.of(context).labelSmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getEventTypeColor(String eventType) {
    switch (eventType.toLowerCase()) {
      case 'diagnosis':
        return Colors.purple;
      case 'follow up':
        return Colors.blue;
      case 'in progress':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      case 'recall':
        return Colors.red;
      case 'not confirmed':
        return Colors.grey;
      default:
        return Colors.deepPurple;
    }
  }
}

// Função auxiliar para converter cores em formato hexadecimal
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
