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

class HumidityLineChart extends StatefulWidget {
  const HumidityLineChart({
    Key? key,
    required this.width,
    required this.height,
    required this.humidities,
    required this.dateTime,
    this.workOrderId, // Novo parâmetro workOrderId
  }) : super(key: key);

  final double width;
  final double height;
  final List<double> humidities;
  final List<DateTime> dateTime;
  final String? workOrderId; // Parâmetro workOrderId nullable

  @override
  State<HumidityLineChart> createState() => _HumidityLineChartState();
}

class _HumidityLineChartState extends State<HumidityLineChart> {
  bool showAverage = false;
  Timer? _timer;

  // Define the line color (blue, e.g., #2797FF)
  static const Color lineColor = Color(0xFF2797FF);

  @override
  void initState() {
    super.initState();
    // Optional: Timer to update the chart every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        // Optionally update humidity data here
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Calculates dynamic y-axis bounds.
  /// For humidity, the lower bound is fixed at 0.
  /// The upper bound is set to at least 100. If your maximum data value is above 100,
  /// it is rounded up to the next multiple of 10.
  Map<String, double> _calculateYAxisBounds(List<double> data) {
    if (data.isEmpty) return {'min': 0, 'max': 100};
    double dataMax = data.reduce((a, b) => a > b ? a : b);
    double dynamicMax = dataMax < 100 ? 100 : (dataMax / 10).ceil() * 10.0;
    return {'min': 0, 'max': dynamicMax};
  }

  /// Configures axis titles with numbers on both left and right sides at 10-unit intervals.
  FlTitlesData _getTitlesData() {
    return FlTitlesData(
      show: true,
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 10,
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
          interval: 10,
          getTitlesWidget: (value, meta) => Text(
            value.toStringAsFixed(0),
            style: const TextStyle(color: lineColor, fontSize: 12),
          ),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          // Display roughly 5 time labels across the bottom.
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

  /// Builds the main chart data (the actual humidity line) using dynamic y-axis bounds.
  LineChartData _buildMainData() {
    final bounds = _calculateYAxisBounds(widget.humidities);
    return LineChartData(
      minY: bounds['min'],
      maxY: bounds['max'],
      backgroundColor: Colors.transparent,
      titlesData: _getTitlesData(),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        _buildLineChartData(widget.humidities, lineColor),
      ],
    );
  }

  /// Builds the average chart data with a horizontal average line,
  /// using the same dynamic y-axis bounds.
  LineChartData _buildAvgData() {
    final data = widget.humidities;
    final bounds = _calculateYAxisBounds(data);
    double avg =
        data.isNotEmpty ? data.reduce((a, b) => a + b) / data.length : 0;
    return LineChartData(
      minY: bounds['min'],
      maxY: bounds['max'],
      backgroundColor: Colors.transparent,
      titlesData: _getTitlesData(),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
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

  /// Generates the line chart data points with gradient styling.
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

  /// Builds the Humidity Min/Max info widget (displayed at the top left).
  Widget _buildMinMaxInfo() {
    if (widget.humidities.isEmpty) return Container();
    double minHumidity = widget.humidities.reduce((a, b) => a < b ? a : b);
    double maxHumidity = widget.humidities.reduce((a, b) => a > b ? a : b);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          showAverage // Condição para mudar o texto
              ? "Max: ${maxHumidity.toStringAsFixed(1)}" // Exibe "Max: valor" se showAverage for true
              : "Humidity", // Exibe "Humidity" se showAverage for false
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: lineColor),
        ),
        if (showAverage) // Exibe "Min: valor" apenas se showAverage for true
          Text(
            "Min: ${minHumidity.toStringAsFixed(1)}",
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
      ],
    );
  }

  /// Builds the legend widget.
  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem("Humidity (%)", lineColor), // Removido (%) da legenda
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
    final data = widget.humidities;
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
          // Top row: Humidity Min/Max info (left) and Show Average toggle (right)
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
          // Chart area with a Stack to overlay the average label when enabled
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
                    'Humidity', // Usa workOrderId se disponível, senão 'Humidity'
                style: const TextStyle(color: lineColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
