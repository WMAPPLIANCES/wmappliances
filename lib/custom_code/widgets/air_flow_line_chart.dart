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

class AirFlowLineChart extends StatefulWidget {
  const AirFlowLineChart({
    Key? key,
    required this.width,
    required this.height,
    required this.airFlows,
    required this.dateTime,
    this.workOrderId, // Adicionado parâmetro workOrderId
  }) : super(key: key);

  final double width;
  final double height;
  final List<double> airFlows;
  final List<DateTime> dateTime;
  final String? workOrderId; // Parâmetro workOrderId nullable

  @override
  State<AirFlowLineChart> createState() => _AirFlowLineChartState();
}

class _AirFlowLineChartState extends State<AirFlowLineChart> {
  bool showAverage = false;
  Timer? _timer;

  // Define a cor da linha (#ACC420)
  static const Color lineColor = Color(0xFFACC420);

  @override
  void initState() {
    super.initState();
    // Timer opcional para atualizar o gráfico a cada 2 segundos
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        // Opcional: atualizar os dados de air flow aqui
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Define os limites do eixo Y fixos de -1 a 30.
  Map<String, double> _calculateYAxisBounds(List<double> data) {
    return {
      'min': -1, // Alterado para -1
      'max': 30,
    };
  }

  /// Configura os títulos dos eixos.
  /// A numeração lateral é dinâmica (intervalo calculado com base nos limites).
  FlTitlesData _getTitlesData() {
    final bounds = _calculateYAxisBounds(widget.airFlows);
    final double interval =
        5; // Intervalo fixo para melhor visualização com range de -1 a 30
    return FlTitlesData(
      show: true,
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40, // espaço para a numeração na esquerda
          interval: interval,
          getTitlesWidget: (value, meta) => Text(
            value.toStringAsFixed(0),
            style: const TextStyle(color: lineColor, fontSize: 12),
          ),
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40, // espaço para a numeração na direita
          interval: interval,
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

  /// Constrói os dados principais do gráfico (a linha do air flow)
  /// com leve deslocamento em minX e maxX para criar "padding" horizontal.
  LineChartData _buildMainData() {
    final bounds = _calculateYAxisBounds(widget.airFlows);
    final data = widget.airFlows;
    return LineChartData(
      // Cria uma pequena folga na esquerda e na direita
      minX: data.isEmpty ? 0 : -0.3,
      maxX: data.isEmpty ? 0 : data.length - 1 + 0.3,
      minY: bounds['min']!,
      maxY: bounds['max']!,
      // Desativa o recorte nas bordas
      clipData:
          FlClipData(left: false, top: false, right: false, bottom: false),
      backgroundColor: Colors.transparent,
      titlesData: _getTitlesData(),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        _buildLineChartData(data, lineColor),
      ],
    );
  }

  /// Constrói os dados médios do gráfico (linha horizontal de média)
  /// usando o mesmo deslocamento em minX/maxX e também desativando o clip.
  LineChartData _buildAvgData() {
    final data = widget.airFlows;
    final bounds = _calculateYAxisBounds(data);
    double avg =
        data.isNotEmpty ? data.reduce((a, b) => a + b) / data.length : 0;
    return LineChartData(
      minX: data.isEmpty ? 0 : -0.3,
      maxX: data.isEmpty ? 0 : data.length - 1 + 0.3,
      minY: bounds['min']!,
      maxY: bounds['max']!,
      clipData:
          FlClipData(left: false, top: false, right: false, bottom: false),
      backgroundColor: Colors.transparent,
      titlesData: _getTitlesData(),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            data.length,
            (index) => FlSpot(index.toDouble(), avg),
          ),
          isCurved: true,
          color: lineColor.withOpacity(0.5),
          barWidth: 3,
        ),
      ],
    );
  }

  /// Gera os pontos de dados do gráfico com estilo de gradiente.
  LineChartBarData _buildLineChartData(List<double> data, Color color) {
    return LineChartBarData(
      spots: List.generate(
        data.length,
        (index) => FlSpot(index.toDouble(), data[index]),
      ),
      isCurved: true,
      gradient: LinearGradient(
        colors: [color, Colors.white],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      barWidth: 4,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [color.withOpacity(0.3), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  /// Constrói o widget de informações de mínimo/máximo do air flow (exibido no canto superior esquerdo).
  Widget _buildMinMaxInfo() {
    if (widget.airFlows.isEmpty) return Container();
    double minAirFlow = widget.airFlows.reduce((a, b) => a < b ? a : b);
    double maxAirFlow = widget.airFlows.reduce((a, b) => a > b ? a : b);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          showAverage // Condição para mudar o texto
              ? "Max: ${maxAirFlow.toStringAsFixed(1)}" // Exibe "Max: valor" se showAverage for true
              : "Air Flow (Mph)",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: lineColor,
          ),
        ),
        if (showAverage) // Exibe "Min: valor" apenas se showAverage for true
          Text(
            "Min: ${minAirFlow.toStringAsFixed(1)}",
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
      ],
    );
  }

  /// Constrói o widget da legenda (ex: para mostrar a cor da linha).
  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem("Air Flow (Mph)", lineColor),
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
    final data = widget.airFlows;
    double computedAvg =
        data.isNotEmpty ? data.reduce((a, b) => a + b) / data.length : 0;

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.black87, Colors.black54],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Linha superior: informações de Air Flow Min/Max (esquerda) e toggle "Show Average" (direita)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMinMaxInfo(),
              Row(
                children: [
                  const Text(
                    "Show Average",
                    style: TextStyle(color: lineColor),
                  ),
                  Switch(
                    value: showAverage,
                    activeColor: lineColor,
                    onChanged: (value) {
                      setState(() {
                        showAverage = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          // Área do gráfico com um Stack para sobrepor o rótulo da média quando ativado
          Expanded(
            child: SingleChildScrollView(
              // Adicionado SingleChildScrollView para rolagem horizontal
              scrollDirection: Axis.horizontal, // Habilita rolagem horizontal
              child: Stack(
                children: [
                  SizedBox(
                    width: widget.width *
                        2, // Aumenta a largura para habilitar a rolagem, ajuste o multiplicador se necessário
                    height: widget.height * 0.8,
                    child: LineChart(
                      showAverage ? _buildAvgData() : _buildMainData(),
                    ),
                  ),
                  if (showAverage)
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                          "Average: ${computedAvg.toStringAsFixed(1)}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            // Row para alinhar o texto no centro
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.workOrderId ??
                    'Air Flow (Mph)', // Usa workOrderId se disponível, senão 'Air Flow (Mph)'
                style: const TextStyle(color: lineColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
