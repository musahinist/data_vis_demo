import 'package:data_visualization/data/model/price_entry.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DemoPriceChartData {
  static final List<Color> gradientColors = [
    Colors.green[200],
    Colors.green
    // const Color(0xff23b6e6),
    // const Color(0xff02d39a),
  ];
  //FlSpot(0, 3),
  static List<LineChartBarData> lineBarsData(List<PriceEntry> spotList) {
    print(spotList);
    return [
      LineChartBarData(
        spots: spotList
            .map<FlSpot>((e) => FlSpot(e.d.toDouble(), e.c.toDouble()))
            .toList(),
        isCurved: true,
        curveSmoothness: 0.5,
        preventCurveOverShooting: true,
        colors: gradientColors,
        barWidth: 2,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ];
  }

  static LineTouchData get lineTouchData => LineTouchData(
        enabled: true,
        fullHeightTouchLine: true,
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.green,
          showOnTopOfTheChartBoxArea: true,
        ),
      );
  static FlGridData get gridData => FlGridData(
      show: false,
      drawHorizontalLine: true,
      getDrawingHorizontalLine: getDrawingLine,
      drawVerticalLine: true,
      getDrawingVerticalLine: getDrawingLine);

  static FlLine getDrawingLine(double value) => FlLine(
        color: const Color(0xff37434d),
        strokeWidth: 10,
      );

  static FlBorderData get borderData => FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      );

  static FlTitlesData get titlesData => FlTitlesData(
        show: false,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 25,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: -28,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          reservedSize: 30,
          margin: 10,
        ),
      );
}
