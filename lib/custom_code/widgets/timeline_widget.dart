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

class TimelineWidget extends StatefulWidget {
  const TimelineWidget({
    Key? key,
    this.width,
    this.height,
    required this.appointments,
    this.showDate = true,
    this.listAppointment,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<SchedulesRow> appointments;
  final bool showDate;
  final dynamic listAppointment;

  @override
  _TimelineWidgetState createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  @override
  Widget build(BuildContext context) {
    // Garantir que há appointments para mostrar
    if (widget.appointments.isEmpty) {
      return Center(
        child: Text(
          'Nenhum agendamento encontrado',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    // Ordenar agendamentos por horário
    final sortedAppointments = [...widget.appointments];
    try {
      sortedAppointments.sort((a, b) {
        final aTime = _parseDateTime(a.startTime ?? a.appointmentStart);
        final bTime = _parseDateTime(b.startTime ?? b.appointmentStart);
        if (aTime == null || bTime == null) return 0;
        return aTime.compareTo(bTime);
      });
    } catch (e) {
      print('Erro ao ordenar: $e');
      // Erro ao ordenar, ignora
    }

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: ListView.builder(
        itemCount: sortedAppointments.length,
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          final appointment = sortedAppointments[index];
          final isFirst = index == 0;
          final isLast = index == sortedAppointments.length - 1;

          return _buildTimelineItem(appointment, isFirst, isLast);
        },
      ),
    );
  }

  DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;

    try {
      if (value is DateTime) {
        return value;
      } else if (value is String) {
        // Tentar converter de string ISO para DateTime
        return DateTime.parse(value);
      } else {
        // Para outros formatos, converter para string e tentar parse
        return DateTime.parse(value.toString());
      }
    } catch (e) {
      print('Erro ao converter data: $e');
      return null;
    }
  }

  Widget _buildTimelineItem(
      SchedulesRow appointment, bool isFirst, bool isLast) {
    // Formatação de horários
    String startFormatted = '--:--';
    String endFormatted = '--:--';
    String dateFormatted = '';

    try {
      // Obter valores de tempo inicial e final
      final startTimeValue =
          appointment.startTime ?? appointment.appointmentStart;
      final endTimeValue = appointment.endTime ?? appointment.appointmentEnd;

      // Converter para DateTime
      final startTime = _parseDateTime(startTimeValue);
      final endTime = _parseDateTime(endTimeValue);

      if (startTime != null) {
        startFormatted = DateFormat.jm().format(startTime);
        if (widget.showDate) {
          dateFormatted = DateFormat('dd/MM/yyyy').format(startTime);
        }
      }

      if (endTime != null) {
        endFormatted = DateFormat.jm().format(endTime);
      }
    } catch (e) {
      print('Erro ao formatar datas: $e');
      // Erro ao formatar datas, usar valores padrão
    }

    final backgroundColor = _getStatusColor(appointment);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Coluna da timeline (linha vertical + círculo)
          SizedBox(
            width: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Linha vertical
                if (!isFirst || !isLast)
                  Positioned(
                    top: isFirst ? 25 : 0,
                    bottom: isLast ? 25 : 0,
                    child: Container(
                      width: 2,
                      color: Colors.grey.shade300,
                    ),
                  ),

                // Círculo do evento
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Conteúdo do card
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Card(
                elevation: 2,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cabeçalho: Horário e Número da Parada
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Horário do evento
                          Row(
                            children: [
                              Icon(Icons.access_time,
                                  size: 16, color: backgroundColor),
                              SizedBox(width: 4),
                              Text(
                                '$startFormatted - $endFormatted',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),

                          // Número da parada
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: backgroundColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Parada #${appointment.stopNumber ?? "-"}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: backgroundColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Data (opcional)
                      if (widget.showDate && dateFormatted.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            dateFormatted,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),

                      Divider(height: 16),

                      // Nome do técnico
                      Row(
                        children: [
                          Icon(Icons.person,
                              size: 18, color: Colors.grey.shade700),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              appointment.techniciansName ?? 'Sem técnico',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      // Cliente
                      if (appointment.customerName != null &&
                          appointment.customerName!.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Icon(Icons.home,
                                  size: 18, color: Colors.grey.shade700),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  appointment.customerName!,
                                  style: TextStyle(fontSize: 13),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                      SizedBox(height: 10),

                      // Status do agendamento
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          appointment.appointmentType ??
                              appointment.appointmentStatus ??
                              'Agendamento',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(SchedulesRow appointment) {
    try {
      final status = appointment.appointmentStatus?.toLowerCase() ?? '';
      final type = appointment.appointmentType?.toLowerCase() ?? '';

      if (status.contains('completed') || status.contains('concluído')) {
        return Colors.green;
      } else if (status.contains('pending') || status.contains('pendente')) {
        return Colors.orange;
      } else if (status.contains('canceled') || status.contains('cancelado')) {
        return Colors.red.shade400;
      } else if (type.contains('diagnosis') || type.contains('diagnóstico')) {
        return Colors.blue;
      } else if (type.contains('installation') || type.contains('instalação')) {
        return Colors.purple;
      } else if (type.contains('repair') || type.contains('reparo')) {
        return Colors.teal;
      }
    } catch (e) {
      print('Erro ao determinar cor: $e');
      // Erro ao determinar cor
    }

    return Colors.blueGrey;
  }
}
