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

import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:intl/intl.dart'; // Para formatação de data

// ATENÇÃO: Certifique-se de que o nome da classe a seguir seja exatamente o mesmo
// que o nome informado no editor do FlutterFlow para este custom widget.
class DateTimePicker extends StatefulWidget {
  const DateTimePicker({
    super.key,
    this.width,
    this.height,
    required this.isStartTime, // true para horário de início; false para término
  });

  final double? width;
  final double? height;
  final bool isStartTime;

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? selectedDateTime;
  int selectedHour = 0;

  @override
  void initState() {
    super.initState();
    // Define horários padrão iniciais
    final now = DateTime.now();
    if (widget.isStartTime) {
      selectedDateTime =
          DateTime(now.year, now.month, now.day, 8, 0); // 8:00 AM
    } else {
      selectedDateTime =
          DateTime(now.year, now.month, now.day, 12, 0); // 12:00 PM
    }
    selectedHour = selectedDateTime?.hour ?? (widget.isStartTime ? 8 : 12);
    print(
        "DateTimePicker - initState: selectedHour = $selectedHour, selectedDateTime = $selectedDateTime");
  }

  void _incrementHour() {
    print(
        "DateTimePicker - _incrementHour - Before: selectedHour = $selectedHour, selectedDateTime = $selectedDateTime");
    setState(() {
      selectedHour = (selectedHour + 1) % 24;
      if (selectedDateTime != null) {
        selectedDateTime = DateTime(
          selectedDateTime!.year,
          selectedDateTime!.month,
          selectedDateTime!.day,
          selectedHour,
          0,
        );
      }
    });
    _updateAppState();
    print(
        "DateTimePicker - _incrementHour - After: selectedHour = $selectedHour, selectedDateTime = $selectedDateTime");
  }

  void _decrementHour() {
    print(
        "DateTimePicker - _decrementHour - Before: selectedHour = $selectedHour, selectedDateTime = $selectedDateTime");
    setState(() {
      selectedHour = (selectedHour - 1 + 24) % 24;
      if (selectedDateTime != null) {
        selectedDateTime = DateTime(
          selectedDateTime!.year,
          selectedDateTime!.month,
          selectedDateTime!.day,
          selectedHour,
          0,
        );
      }
    });
    _updateAppState();
    print(
        "DateTimePicker - _decrementHour - After: selectedHour = $selectedHour, selectedDateTime = $selectedDateTime");
  }

  void _setPredefinedTime(int hour) {
    print(
        "DateTimePicker - _setPredefinedTime - Hour received: $hour - Before: selectedHour = $selectedHour, selectedDateTime = $selectedDateTime");
    setState(() {
      selectedHour = hour;
      if (selectedDateTime != null) {
        selectedDateTime = DateTime(
          selectedDateTime!.year,
          selectedDateTime!.month,
          selectedDateTime!.day,
          selectedHour,
          0,
        );
      } else {
        final now = DateTime.now();
        selectedDateTime =
            DateTime(now.year, now.month, now.day, selectedHour, 0);
      }
    });
    _updateAppState();
    print(
        "DateTimePicker - _setPredefinedTime - After: selectedHour = $selectedHour, selectedDateTime = $selectedDateTime");
  }

  void _updateAppState() {
    if (selectedDateTime != null) {
      print(
          "DateTimePicker - _updateAppState - Updating App State with: $selectedDateTime for isStartTime: ${widget.isStartTime}");
      if (widget.isStartTime) {
        FFAppState().startTime = selectedDateTime;
      } else {
        FFAppState().endTime = selectedDateTime;
      }
    } else {
      print(
          "DateTimePicker - _updateAppState - selectedDateTime is NULL, App State NOT updated.");
    }
  }

  bool _isPredefinedTimeSelected(int hour) {
    return selectedHour == hour;
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = selectedDateTime != null
        ? DateFormat('dd/MM/yyyy').format(selectedDateTime!)
        : '';
    final formattedTime = selectedHour.toString().padLeft(2, '0') + ':00';
    final buttonText = widget.isStartTime
        ? 'Start Time: ${formattedDate.isNotEmpty ? formattedDate + ' ' : ''}$formattedTime'
        : 'End Time: ${formattedDate.isNotEmpty ? formattedDate + ' ' : ''}$formattedTime';

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  DateTime now = DateTime.now();
                  DateTime initialDateTimeForPicker = selectedDateTime ??
                      (widget.isStartTime
                          ? DateTime(now.year, now.month, now.day, 8, 0)
                          : DateTime(now.year, now.month, now.day, 12, 0));

                  DateTime? dateTime = await showOmniDateTimePicker(
                    context: context,
                    initialDate: initialDateTimeForPicker,
                    firstDate: DateTime(1600),
                    lastDate: DateTime.now().add(const Duration(days: 3652)),
                    is24HourMode: true,
                    isShowSeconds: false,
                    minutesInterval: 1,
                    secondsInterval: 1,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    constraints: const BoxConstraints(
                      maxWidth: 350,
                      maxHeight: 650,
                    ),
                    transitionBuilder: (context, anim1, anim2, child) {
                      return FadeTransition(
                        opacity: anim1.drive(
                          Tween(
                            begin: 0,
                            end: 1,
                          ),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                    barrierDismissible: true,
                  );

                  if (dateTime != null) {
                    setState(() {
                      selectedDateTime = dateTime;
                      selectedHour = dateTime.hour;
                    });
                    print(
                        'DateTimePicker - ElevatedButton Picker - Selected DateTime: $dateTime');
                    _updateAppState();
                  }
                },
                child: Text(buttonText),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (widget.isStartTime) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ElevatedButton(
                            onPressed: () => _setPredefinedTime(8),
                            child: Text('8:00 AM'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 30),
                              backgroundColor: _isPredefinedTimeSelected(8)
                                  ? null
                                  : Colors.grey[300],
                              foregroundColor: _isPredefinedTimeSelected(8)
                                  ? null
                                  : Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ElevatedButton(
                            onPressed: () => _setPredefinedTime(12),
                            child: Text('12:00 PM'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 30),
                              backgroundColor: _isPredefinedTimeSelected(12)
                                  ? null
                                  : Colors.grey[300],
                              foregroundColor: _isPredefinedTimeSelected(12)
                                  ? null
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ] else ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ElevatedButton(
                            onPressed: () => _setPredefinedTime(12),
                            child: Text('12:00 PM'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 30),
                              backgroundColor: _isPredefinedTimeSelected(12)
                                  ? null
                                  : Colors.grey[300],
                              foregroundColor: _isPredefinedTimeSelected(12)
                                  ? null
                                  : Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ElevatedButton(
                            onPressed: () => _setPredefinedTime(16),
                            child: Text('4:00 PM'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 30),
                              backgroundColor: _isPredefinedTimeSelected(16)
                                  ? null
                                  : Colors.grey[300],
                              foregroundColor: _isPredefinedTimeSelected(16)
                                  ? null
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (widget.isStartTime) ...[
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: _decrementHour,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ElevatedButton(
                            onPressed: () => _setPredefinedTime(16),
                            child: Text('4:00 PM'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 30),
                              backgroundColor: _isPredefinedTimeSelected(16)
                                  ? null
                                  : Colors.grey[300],
                              foregroundColor: _isPredefinedTimeSelected(16)
                                  ? null
                                  : Colors.black87,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: _incrementHour,
                        ),
                      ] else ...[
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: _decrementHour,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ElevatedButton(
                            onPressed: () => _setPredefinedTime(20),
                            child: Text('8:00 PM'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 30),
                              backgroundColor: _isPredefinedTimeSelected(20)
                                  ? null
                                  : Colors.grey[300],
                              foregroundColor: _isPredefinedTimeSelected(20)
                                  ? null
                                  : Colors.black87,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: _incrementHour,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
