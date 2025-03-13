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

class TemperatureLineChart extends StatefulWidget {
  const TemperatureLineChart({
    Key? key,
    required this.width,
    required this.height,
    required this.surfaceTemperatures,
    required this.dateTime,
    this.workOrderId, // Adicionado parâmetro workOrderId
  }) : super(key: key);

  final double width;
  final double height;
  final List<double> surfaceTemperatures;
  final List<DateTime> dateTime;
  final String? workOrderId; // Parâmetro workOrderId nullable

  @override
  State<TemperatureLineChart> createState() => _TemperatureLineChartState();
}

class _TemperatureLineChartState extends State<TemperatureLineChart> {
  bool showAverage = false;
  Timer? _timer;

  // Alterado: cor da linha agora definida como vermelho.
  static const Color lineColor = Colors.red;

  @override
  void initState() {
    super.initState();
    // Timer para atualizar o gráfico a cada 2 segundos (opcional)
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        // Opcional: atualizar os dados de temperatura da superfície aqui
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Configura os títulos dos eixos com números nos lados esquerdo e direito com intervalos de 20 unidades.
  FlTitlesData _getTitlesData() {
    return FlTitlesData(
      show: true,
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 1,
          getTitlesWidget: (value, meta) => Text(
            value.toStringAsFixed(0),
            style: const TextStyle(color: lineColor, fontSize: 12),
          ),
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
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
          // Exibe aproximadamente 5 labels de tempo na parte inferior
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

  // Calcula os limites do eixo y dinamicamente com base nos dados.
  Map<String, double> _calculateYAxisBounds(List<double> data) {
    // Se os dados estiverem vazios, define o padrão de 0 a 500°F.
    if (data.isEmpty) return {'min': 0, 'max': 500};

    double dataMax = data.reduce((a, b) => a > b ? a : b);
    double dataMin = data.reduce((a, b) => a < b ? a : b);
    // Arredonda o máximo para o próximo múltiplo de 20.
    double dynamicMax = (dataMax / 10).ceil() * 10.0;
    // Para o mínimo, arredonda para baixo para o múltiplo de 20 mais próximo.
    double dynamicMin = (dataMin / 10).floor() * 10.0;
    return {'min': dynamicMin, 'max': dynamicMax};
  }

  // Constrói os dados principais do gráfico (a linha de temperatura real) usando os limites dinâmicos do eixo y.
  LineChartData _buildMainData() {
    final data = widget.surfaceTemperatures;
    final yBounds = _calculateYAxisBounds(data);
    return LineChartData(
      minY: yBounds['min'],
      maxY: yBounds['max'],
      backgroundColor: Colors.transparent,
      titlesData: _getTitlesData(),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        _buildLineChartData(data, lineColor),
      ],
    );
  }

  // Constrói os dados do gráfico de média utilizando os mesmos limites dinâmicos do eixo y.
  LineChartData _buildAvgData() {
    final data = widget.surfaceTemperatures;
    final yBounds = _calculateYAxisBounds(data);
    double avg =
        data.isNotEmpty ? data.reduce((a, b) => a + b) / data.length : 0;
    return LineChartData(
      minY: yBounds['min'],
      maxY: yBounds['max'],
      backgroundColor: Colors.transparent,
      titlesData: _getTitlesData(),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        // Desenha uma linha horizontal na média
        LineChartBarData(
          spots: List.generate(
              data.length, (index) => FlSpot(index.toDouble(), avg)),
          isCurved: true,
          color: lineColor.withOpacity(0.5),
          barWidth: 3,
        ),
      ],
    );
  }

  // Gera os pontos de dados do gráfico com estilo de gradiente.
  LineChartBarData _buildLineChartData(List<double> data, Color color) {
    return LineChartBarData(
      spots: List.generate(
          data.length, (index) => FlSpot(index.toDouble(), data[index])),
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

  // Constrói o widget de informações de Mín/Máx da Temperatura da Superfície (exibido no canto superior esquerdo).
  Widget _buildMinMaxInfo() {
    if (widget.surfaceTemperatures.isEmpty) return Container();
    double minTemp = widget.surfaceTemperatures.reduce((a, b) => a < b ? a : b);
    double maxTemp = widget.surfaceTemperatures.reduce((a, b) => a > b ? a : b);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          showAverage // Condição para mudar o texto
              ? "Max: ${maxTemp.toStringAsFixed(1)}" // Exibe "Max: valor" se showAverage for true
              : "Temperature (F)",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: lineColor,
          ),
        ),
        if (showAverage) // Exibe "Min: valor" apenas se showAverage for true
          Text(
            "Min: ${minTemp.toStringAsFixed(1)}",
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
      ],
    );
  }

  // Constrói o widget de legenda.
  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem("Surface Temperature (F)", lineColor),
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
    // Calcula a média para sobreposição.
    final data = widget.surfaceTemperatures;
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
          // Linha superior: informações de Mín/Máx à esquerda e toggle de "Show Average" à direita.
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
          // Área do gráfico com um Stack para sobrepor o label da média (se ativado).
          Expanded(
            child: SingleChildScrollView(
              // Added SingleChildScrollView for horizontal scrolling
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Stack(
                children: [
                  SizedBox(
                    width: widget.width *
                        2, // Make the chart wider to enable scrolling, adjust multiplier as needed
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
                    'Surface Temperature (F)', // Usa workOrderId se disponível, senão 'Surface Temperature (F)'
                style: const TextStyle(color: lineColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
