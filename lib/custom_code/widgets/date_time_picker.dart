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

/// ATENÇÃO: Certifique-se de que o nome da classe a seguir seja exatamente o
/// mesmo
/// que o nome informado no editor do FlutterFlow para este custom widget.
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
        ? DateFormat('MM/dd/yyyy').format(selectedDateTime!) // Formato US
        : '';
    final formattedTime = selectedHour.toString().padLeft(2, '0') + ':00';
    final buttonText = widget.isStartTime
        ? 'Start Time: ${formattedDate.isNotEmpty ? formattedDate + ' ' : ''}$formattedTime'
        : 'End Time: ${formattedDate.isNotEmpty ? formattedDate + ' ' : ''}$formattedTime';

    return Container(
      // Envolvi o Column em um Container para adicionar padding geral
      padding: const EdgeInsets.all(16.0), // Adicionado padding geral
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        // Adicionado um BoxDecoration para estilo
        color: Color(0xFF212B36), // Cor de fundo alterada para #212B36
        borderRadius: BorderRadius.circular(8), // Bordas arredondadas
        border: Border.all(color: Colors.grey.shade300), // Borda sutil
      ),
      child: Column(
        // Todos os elementos estão dentro do Column, que está dentro do Container
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Esticar os elementos horizontalmente
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

              setState(() {
                selectedDateTime = dateTime;
                selectedHour = dateTime!
                    .hour; // Force non-nullable because dateTime is only null if picker is cancelled
              });
              print(
                  'DateTimePicker - ElevatedButton Picker - Selected DateTime: $dateTime');
              _updateAppState();
            },
            style: ElevatedButton.styleFrom(
              // Estilo do botão principal
              padding: const EdgeInsets.symmetric(
                  vertical: 12), // Aumenta o padding vertical
              textStyle:
                  TextStyle(fontWeight: FontWeight.bold), // Texto em negrito
            ),
            child: Text(buttonText),
          ),
          const SizedBox(
              height:
                  12), // Espaçamento entre o botão principal e os botões de hora
          // Título para os botões de hora predefinidos
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(
              'Predefined Times:', // Traduzido para Inglês
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Wrap(
            // Use Wrap para quebrar os botões para a próxima linha em telas menores
            alignment: WrapAlignment
                .spaceEvenly, // Espaçamento uniforme entre os botões
            spacing: 8.0, // Espaçamento horizontal entre os botões
            runSpacing: 8.0, // Espaçamento vertical entre as linhas de botões
            children: [
              if (widget.isStartTime) ...[
                ElevatedButton(
                  onPressed: () => _setPredefinedTime(8),
                  child: Text('8:00 AM'),
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(0, 36), // Aumenta a altura mínima dos botões
                    padding: EdgeInsets.symmetric(
                        horizontal: 16), // Padding horizontal
                    backgroundColor: _isPredefinedTimeSelected(8)
                        ? Theme.of(context)
                            .colorScheme
                            .primary // Cor primária se selecionado
                        : Colors.grey[300],
                    foregroundColor: _isPredefinedTimeSelected(8)
                        ? Colors.white // Texto branco se selecionado
                        : Colors.black87,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _setPredefinedTime(12),
                  child: Text('12:00 PM'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 36),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    backgroundColor: _isPredefinedTimeSelected(12)
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[300],
                    foregroundColor: _isPredefinedTimeSelected(12)
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _setPredefinedTime(16),
                  child: Text('4:00 PM'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 36),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    backgroundColor: _isPredefinedTimeSelected(16)
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[300],
                    foregroundColor: _isPredefinedTimeSelected(16)
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ] else ...[
                ElevatedButton(
                  onPressed: () => _setPredefinedTime(12),
                  child: Text('12:00 PM'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 36),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    backgroundColor: _isPredefinedTimeSelected(12)
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[300],
                    foregroundColor: _isPredefinedTimeSelected(12)
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _setPredefinedTime(16),
                  child: Text('4:00 PM'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 36),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    backgroundColor: _isPredefinedTimeSelected(16)
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[300],
                    foregroundColor: _isPredefinedTimeSelected(16)
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _setPredefinedTime(20),
                  child: Text('8:00 PM'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 36),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    backgroundColor: _isPredefinedTimeSelected(20)
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[300],
                    foregroundColor: _isPredefinedTimeSelected(20)
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(
              height:
                  12), // Espaçamento antes dos controles de incremento/decremento
          Row(
            // Row para os icon buttons e o botão de hora atual
            mainAxisAlignment: MainAxisAlignment
                .spaceAround, // Espaçamento entre os ícones e o botão
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline,
                    size: 30), // Ícone maior e mais claro
                onPressed: _decrementHour,
              ),
              ElevatedButton(
                // Botão "customizado" para exibir a hora atual selecionada
                onPressed:
                    () {}, // Pode remover o onPressed se não quiser ação ao clicar
                child: Text(
                  formattedTime,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold), // Estilo do texto da hora
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size(80, 36), // Tamanho mínimo para o botão da hora
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  backgroundColor:
                      Colors.blueGrey.shade100, // Cor de fundo suave
                  foregroundColor: Colors.black87,
                  elevation: 0, // Sem elevação para um visual mais plano
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8)), // Bordas arredondadas
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline,
                    size: 30), // Ícone maior e mais claro
                onPressed: _incrementHour,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
