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

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:math' show max;

class TodayAppointment extends StatefulWidget {
  const TodayAppointment({
    super.key,
    this.width,
    this.height,
    this.appointmentDate,
    this.techniciansphoto = '',
    required this.allSchedules,
    this.technicianColor = const Color(0xFF4B39EF),
    this.techniciansName = 'Técnico',
    this.technicianuuid = '',
  });

  final double? width;
  final double? height;
  final DateTime? appointmentDate;
  final String techniciansphoto;
  final dynamic allSchedules;
  final Color technicianColor;
  final String techniciansName;
  final String technicianuuid;

  @override
  State<TodayAppointment> createState() => _TodayAppointmentState();
}

class _TodayAppointmentState extends State<TodayAppointment> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  List<dynamic> _filteredSchedules = [];
  bool _showDetails = false;
  int _selectedScheduleIndex = -1;
  final ScrollController _timelineScrollController = ScrollController();

  // Horários para a timeline
  final List<String> _timeSlots = [
    '4 am',
    '5 am',
    '6 am',
    '7 am',
    '8 am',
    '9 am',
    '10 am',
    '11 am',
    '12 pm',
    '1 pm',
    '2 pm',
    '3 pm',
    '4 pm',
    '5 pm',
    '6 pm',
    '7 pm',
    '8 pm',
    '9 pm',
    '10 pm',
    '11 pm'
  ];

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.appointmentDate ?? DateTime.now();
    _focusedDay = _selectedDay;
    _filterSchedules();

    // Scrollar para a hora atual aproximadamente
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final now = DateTime.now();
      final currentHour = now.hour;
      if (currentHour >= 4 && currentHour <= 23) {
        // Calcular a posição aproximada para scrollar
        final position = (currentHour - 4) * 100.0; // 100px por hora
        _timelineScrollController.animateTo(
          position,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timelineScrollController.dispose();
    super.dispose();
  }

  void _filterSchedules() {
    if (widget.allSchedules != null) {
      try {
        final List<dynamic> schedules = _parseSchedules(widget.allSchedules);

        setState(() {
          _filteredSchedules = schedules.where((schedule) {
            if (schedule['date'] == null) return false;
            try {
              final scheduleDate = DateTime.parse(schedule['date'].toString());
              return _isSameDay(scheduleDate, _selectedDay);
            } catch (e) {
              print('Erro ao analisar data: ${schedule['date']} - $e');
              return false;
            }
          }).toList();
        });
      } catch (e) {
        print('Erro ao filtrar agendamentos: $e');
        setState(() {
          _filteredSchedules = [];
        });
      }
    } else {
      setState(() {
        _filteredSchedules = [];
      });
    }
  }

  List<dynamic> _parseSchedules(dynamic schedulesData) {
    if (schedulesData == null) {
      return [];
    }

    if (schedulesData is String) {
      try {
        return jsonDecode(schedulesData) ?? [];
      } catch (e) {
        print('Erro ao decodificar JSON: $e');
        return [];
      }
    } else if (schedulesData is List) {
      return schedulesData;
    } else {
      try {
        // Tentar converter para string e depois para JSON
        final String dataStr = schedulesData.toString();
        try {
          return jsonDecode(dataStr) ?? [];
        } catch (e) {
          print('Erro ao decodificar string: $e');
          return [];
        }
      } catch (e) {
        print('Erro ao converter para string: $e');
        return [];
      }
    }
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildWeeklyCalendar(),
          Expanded(
            child: _showDetails && _selectedScheduleIndex >= 0
                ? _buildScheduleDetails()
                : _buildTimelineView(),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyCalendar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: CalendarFormat.week,
        selectedDayPredicate: (day) {
          return _isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            _showDetails = false;
            _selectedScheduleIndex = -1;
          });
          _filterSchedules();
        },
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.white),
          rightChevronIcon:
              const Icon(Icons.chevron_right, color: Colors.white),
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: const TextStyle(color: Colors.white),
          weekendTextStyle: TextStyle(color: Colors.grey[400]),
          selectedDecoration: BoxDecoration(
            color: widget.technicianColor.withOpacity(0.8),
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.grey[700],
            shape: BoxShape.circle,
          ),
        ),
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildTimelineView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Hero(
                tag: 'tech-${widget.technicianuuid}',
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.technicianColor,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: CachedNetworkImage(
                      imageUrl: widget.techniciansphoto,
                      placeholder: (context, url) => CircularProgressIndicator(
                        color: widget.technicianColor,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.person),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.techniciansName,
                      style: FlutterFlowTheme.of(context).titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      DateFormat('EEEE, dd MMM yyyy').format(_selectedDay),
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: _buildTimeline(),
        ),
      ],
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        // Cabeçalho da timeline (horas)
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 2),
                blurRadius: 5,
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            controller: _timelineScrollController,
            scrollDirection: Axis.horizontal,
            itemCount: _timeSlots.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100, // Largura de cada hora
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  _timeSlots[index],
                  style: FlutterFlowTheme.of(context).bodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              );
            },
          ),
        ),

        // Conteúdo da timeline
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: _filteredSchedules.isEmpty
                ? Center(
                    child: Text(
                      'Nenhum agendamento para este dia',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  )
                : SingleChildScrollView(
                    controller: _timelineScrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _timeSlots.map((timeSlot) {
                        return _buildTimeSlotColumn(timeSlot);
                      }).toList(),
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlotColumn(String timeSlot) {
    // Converter timeSlot para hora em formato 24h
    final hour = _parseTimeSlot(timeSlot);
    final scheduleInThisHour = _getSchedulesForHour(hour);

    return Container(
      width: 100, // Mesma largura do cabeçalho
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: scheduleInThisHour.map((schedule) {
          return _buildAppointmentCard(schedule);
        }).toList(),
      ),
    );
  }

  int _parseTimeSlot(String timeSlot) {
    // Converter de "4 am", "5 pm", etc. para números de 0-23
    final parts = timeSlot.split(' ');
    int hour = int.parse(parts[0]);
    if (parts[1].toLowerCase() == 'pm' && hour < 12) {
      hour += 12;
    } else if (parts[1].toLowerCase() == 'am' && hour == 12) {
      hour = 0;
    }
    return hour;
  }

  List<dynamic> _getSchedulesForHour(int hour) {
    // Filtrar agendamentos que começam nesta hora
    if (_filteredSchedules.isEmpty) {
      return [];
    }

    return _filteredSchedules.where((schedule) {
      if (schedule == null || schedule['time'] == null) return false;
      try {
        final timeParts = schedule['time'].toString().split(':');
        if (timeParts.isEmpty) return false;
        final scheduleHour = int.parse(timeParts[0]);
        return scheduleHour == hour;
      } catch (e) {
        print('Erro ao analisar hora do agendamento: $e');
        return false;
      }
    }).toList();
  }

  Widget _buildAppointmentCard(dynamic schedule) {
    // Extrair o tempo de duração do agendamento (padrão: 1 hora)
    int durationMinutes = 60;
    if (schedule != null && schedule['duration_minutes'] != null) {
      try {
        durationMinutes = int.parse(schedule['duration_minutes'].toString());
      } catch (e) {
        // Manter o padrão e registrar erro
        print(
            'Erro ao converter duração: ${schedule['duration_minutes']} - $e');
      }
    }

    // Garante um valor mínimo para altura do card
    final cardHeight = max(durationMinutes.toDouble(), 60.0);

    return GestureDetector(
      onTap: () {
        if (schedule != null) {
          final index = _filteredSchedules.indexOf(schedule);
          if (index != -1) {
            setState(() {
              _showDetails = true;
              _selectedScheduleIndex = index;
            });
          }
        }
      },
      child: Container(
        width: 98,
        margin: EdgeInsets.only(top: 4, bottom: 4),
        height: cardHeight,
        decoration: BoxDecoration(
          color: widget.technicianColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.technicianColor.withOpacity(0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.technicianColor.withOpacity(0.1),
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Barra vertical colorida
            Container(
              width: 4,
              height: double.infinity,
              decoration: BoxDecoration(
                color: widget.technicianColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
            ),
            // Conteúdo
            Padding(
              padding: EdgeInsets.fromLTRB(8, 6, 6, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: _getStatusColor(schedule?['status']),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _getStatusText(schedule?['status']),
                          style:
                              FlutterFlowTheme.of(context).bodySmall.copyWith(
                                    fontSize: 8,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          schedule?['time']?.toString() ?? '--:--',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    schedule?['client_name']?.toString() ?? 'Cliente',
                    style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Expanded(
                    child: Text(
                      schedule?['address']?.toString() ??
                          'Endereço não especificado',
                      style: FlutterFlowTheme.of(context).bodySmall.copyWith(
                            fontSize: 9,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).animate().slideY(
            begin: 0.05,
            end: 0,
            duration: 300.ms,
            delay: 100.ms,
            curve: Curves.easeOutQuad,
          ),
    );
  }

  Color _getStatusColor(dynamic status) {
    if (status == null) return Colors.grey;

    switch (status.toString().toLowerCase()) {
      case 'follow-up':
        return Colors.blue;
      case 'recall':
        return Colors.orange;
      case 'diagnosis':
        return Colors.purple;
      case 'normal':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(dynamic status) {
    if (status == null) return 'PENDENTE';
    return status.toString().toUpperCase();
  }

  Widget _buildScheduleDetails() {
    if (_selectedScheduleIndex < 0 ||
        _filteredSchedules.isEmpty ||
        _selectedScheduleIndex >= _filteredSchedules.length) {
      // Caso de erro, voltar para a visualização da timeline
      return _buildTimelineView();
    }

    final schedule = _filteredSchedules[_selectedScheduleIndex];
    if (schedule == null) {
      // Caso de erro, voltar para a visualização da timeline
      return _buildTimelineView();
    }

    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    setState(() {
                      _showDetails = false;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'Detalhes do Agendamento',
                    style: FlutterFlowTheme.of(context).titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 40), // Para balancear o layout
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailCard(
                    title: 'Cliente',
                    value: schedule['client_name']?.toString() ?? 'N/A',
                    icon: Icons.person,
                    color: widget.technicianColor,
                  ),
                  _buildDetailCard(
                    title: 'Serviço',
                    value: schedule['service_type']?.toString() ?? 'N/A',
                    icon: Icons.build,
                    color: widget.technicianColor,
                  ),
                  _buildDetailCard(
                    title: 'Hora',
                    value: schedule['time']?.toString() ?? 'N/A',
                    icon: Icons.access_time,
                    color: widget.technicianColor,
                  ),
                  _buildDetailCard(
                    title: 'Status',
                    value: _getStatusText(schedule['status']),
                    icon: Icons.info_outline,
                    color: _getStatusColor(schedule['status']),
                  ),
                  _buildDetailCard(
                    title: 'Endereço',
                    value: schedule['address']?.toString() ?? 'N/A',
                    icon: Icons.location_on,
                    color: widget.technicianColor,
                  ),
                  _buildDetailCard(
                    title: 'Observações',
                    value: schedule['notes']?.toString() ?? 'Sem observações',
                    icon: Icons.note,
                    color: widget.technicianColor,
                    isMultiline: true,
                  ),
                  _buildDetailCard(
                    title: 'ID do Técnico',
                    value: widget.technicianuuid,
                    icon: Icons.badge,
                    color: widget.technicianColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }

  Widget _buildDetailCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    bool isMultiline = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
            isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FlutterFlowTheme.of(context).bodySmall.copyWith(
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms);
  }
}
