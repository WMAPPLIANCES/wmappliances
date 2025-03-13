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

import 'dart:async';
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class LeakDetectionLineChart extends StatefulWidget {
  const LeakDetectionLineChart({
    Key? key,
    required this.width,
    required this.height,
    required this.leakDetections,
    required this.dateTime,
    this.workOrderId,
  }) : super(key: key);

  final double width;
  final double height;
  final List<bool> leakDetections;
  final List<DateTime> dateTime;
  final String? workOrderId;

  @override
  State<LeakDetectionLineChart> createState() => _LeakDetectionLineChartState();
}

class _LeakDetectionLineChartState extends State<LeakDetectionLineChart> {
  bool showAverage = false;
  Timer? _timer;

  // Define a cor da linha (roxo, exemplo: Colors.purple)
  static const Color lineColor = Colors.purple;

  @override
  void initState() {
    super.initState();
    // Timer opcional para atualizar o gráfico a cada 2 segundos
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        // Opcional: atualizar os dados de leak detection aqui
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Define os limites do eixo Y fixos para booleanos (0 e 1).
  Map<String, double> _calculateYAxisBounds(List<bool> data) {
    return {
      'min': -0.5, // Ajustado para melhor visualização
      'max': 1.5, // Ajustado para melhor visualização
    };
  }

  /// Configura os títulos dos eixos.
  /// A numeração lateral é para 0 e 1 (False e True).
  FlTitlesData _getTitlesData() {
    return FlTitlesData(
      show: true,
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40, // espaço para a numeração na esquerda
          interval: 1,
          getTitlesWidget: (value, meta) => Text(
            value == 0
                ? 'No Leak'
                : 'Leak', // More concise conditional rendering
            style: const TextStyle(color: lineColor, fontSize: 12),
          ),
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false, // Removido números da direita para booleanos
          reservedSize: 40, // espaço para a numeração na direita
          interval: 1,
          getTitlesWidget: (value, meta) => Text(
            value.toStringAsFixed(0),
            style: const TextStyle(color: lineColor, fontSize: 12),
          ),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          // Exibe aproximadamente 5 rótulos de tempo na parte inferior.
          interval: (widget.dateTime.length / 5).toDouble(),
          getTitlesWidget: (value, meta) {
            int index = value.toInt();
            if (index >= 0 && index < widget.dateTime.length) {
              return Text(
                DateFormat.Hm().format(widget.dateTime[index]),
                style: const TextStyle(color: lineColor, fontSize: 10),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  /// Constrói os dados principais do gráfico (a linha de leak detection)
  LineChartData _buildMainData() {
    final bounds = _calculateYAxisBounds(widget.leakDetections);
    final data = widget.leakDetections;
    return LineChartData(
      minY: bounds['min']!,
      maxY: bounds['max']!,
      backgroundColor: Colors.transparent,
      titlesData: _getTitlesData(),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        _buildLineChartData(data, lineColor),
      ],
    );
  }

  /// Constrói os dados médios do gráfico (linha horizontal de média - neste caso, porcentagem de 'true')
  LineChartData _buildAvgData() {
    final data = widget.leakDetections;
    final bounds = _calculateYAxisBounds(data);
    double avg = 0;
    if (data.isNotEmpty) {
      avg = (data.where((element) => element).length / data.length)
          .toDouble(); // Explicitly convert to double to ensure it's a double
    }
    return LineChartData(
      minY: bounds['min']!,
      maxY: bounds['max']!,
      backgroundColor: Colors.transparent,
      titlesData: _getTitlesData(),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            data.length,
            (index) =>
                FlSpot(index.toDouble(), avg), // Line 116 - should be fixed now
          ),
          isCurved: true,
          color: lineColor.withOpacity(0.5),
          barWidth: 3,
        ),
      ],
    );
  }

  /// Gera os pontos de dados do gráfico com estilo de degraus para booleanos.
  LineChartBarData _buildLineChartData(List<bool> data, Color color) {
    return LineChartBarData(
      spots: List.generate(
        data.length,
        (index) => FlSpot(index.toDouble(),
            data[index] ? 1.0 : 0.0), // True = 1.0, False = 0.0
      ),
      isCurved: false, // Linha reta para representar booleanos
      barWidth: 4,
      color: color,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
          show: false), // Removido área abaixo da linha para booleanos
    );
  }

  /// Constrói o widget de informações de mínimo/máximo de leak detection (exibido no canto superior esquerdo).
  Widget _buildMinMaxInfo() {
    if (widget.leakDetections.isEmpty) return Container();
    bool minLeak = widget.leakDetections.reduce((a, b) => a && b
        ? b
        : a); // 'Min' booleano (primeiro 'false' ou último valor se todos 'true')
    bool maxLeak = widget.leakDetections.reduce((a, b) => a || b
        ? b
        : a); // 'Max' booleano (primeiro 'true' ou último valor se todos 'false')

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          showAverage
              ? "Max: ${maxLeak ? 'Leak Detected' : 'No Leak'}" // Exibe 'Max' se showAverage
              : "Leak Detection",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: lineColor,
          ),
        ),
        if (showAverage)
          Text(
            "Min: ${minLeak ? 'Leak Detected' : 'No Leak'}", // Exibe 'Min' se showAverage
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
      ],
    );
  }

  /// Constrói o widget da legenda.
  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem("Leak Status", lineColor),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(label, style: TextStyle(fontSize: 12, color: color)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.leakDetections;
    double computedAvgPercentage = 0;
    if (data.isNotEmpty) {
      computedAvgPercentage =
          (data.where((element) => element).length / data.length) *
              100; // Média em porcentagem
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.black87, Colors.black54],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _buildMinMaxInfo(),
          Row(children: [
            const Text("Show Average", style: TextStyle(color: lineColor)),
            Switch(
                value: showAverage,
                activeColor: lineColor,
                onChanged: (value) => setState(() => showAverage = value)),
          ]),
        ]),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Stack(children: [
              SizedBox(
                width: widget.width * 2,
                height: widget.height * 0.8,
                child:
                    LineChart(showAverage ? _buildAvgData() : _buildMainData()),
              ),
              if (showAverage)
                Center(
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                            "Average: ${computedAvgPercentage.toStringAsFixed(1)}%",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)))),
            ]),
          ),
        ),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(widget.workOrderId ?? 'Leak Detection Status',
              style: const TextStyle(color: lineColor)),
        ]),
      ]),
    );
  }
}
