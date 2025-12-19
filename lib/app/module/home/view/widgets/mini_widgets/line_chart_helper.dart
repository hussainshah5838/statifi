import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartDataHelper {
  static LineChartData mainData(
    List<FlSpot> spots,
    List<Color> gradientColors,
  ) {
    return LineChartData(
      clipData: FlClipData.all(),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) =>
            FlLine(color: Colors.transparent, strokeWidth: 1),
      ),
      titlesData: _buildTitlesData(),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 6,
      lineTouchData: _buildLineTouchData(),
      lineBarsData: [_buildLineChartBarData(spots, gradientColors)],
    );
  }

  static FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          interval: 1,
          getTitlesWidget: _bottomTitleWidgets,
        ),
      ),
    );
  }

  static Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10,
      color: Colors.grey,
    );
    String text = switch (value.toInt()) {
      0 => 'Aug 5',
      1 => 'Aug 6',
      2 => 'Aug 7',
      3 => 'Aug 8',
      4 => 'Aug 9',
      5 => 'Aug 10',
      6 => 'Aug 11',
      _ => '',
    };
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(text, style: style),
    );
  }

  static LineTouchData _buildLineTouchData() {
    return LineTouchData(
      enabled: true,
      getTouchedSpotIndicator: (barData, spotIndexes) {
        return spotIndexes.map((spotIndex) {
          return TouchedSpotIndicatorData(
            FlLine(
              color: Colors.white.withOpacity(0.8),
              strokeWidth: 3,
              dashArray: [7, 7],
            ),
            FlDotData(
              getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                    radius: 6,
                    color: Colors.white,
                    strokeWidth: 2,
                    strokeColor: const Color(0xFF36CFE6),
                  ),
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
        getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
        getTooltipItems: (touchedSpots) {
          return touchedSpots
              .map(
                (spot) => LineTooltipItem(
                  '${spot.x.toInt()}: ${spot.y.toStringAsFixed(1)}',
                  const TextStyle(color: Colors.white),
                ),
              )
              .toList();
        },
      ),
    );
  }

  static LineChartBarData _buildLineChartBarData(
    List<FlSpot> spots,
    List<Color> gradientColors,
  ) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: const Color(0xFF36CFE6),
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientColors,
        ),
      ),
    );
  }
}
