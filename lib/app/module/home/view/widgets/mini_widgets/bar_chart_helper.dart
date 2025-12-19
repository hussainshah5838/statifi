import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import '../../../controller/home_controller.dart';

class BarChartHelpers {
  /// ---------- Y AXIS LABEL ----------
  static Widget buildYAxisLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF98A2B3),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// ---------- DROPDOWN ----------
  static Widget buildDropdown(HomeController controller) {
    return GestureDetector(
      onTap: () {
        if (controller.selectedBarPeriod.value == "This Week") {
          controller.changeBarPeriod("Last Week");
        } else if (controller.selectedBarPeriod.value == "Last Week") {
          controller.changeBarPeriod("This Month");
        } else {
          controller.changeBarPeriod("This Week");
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF1D2939),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white10, width: 1),
        ),
        child: Row(
          children: [
            Obx(
              () => Text(
                controller.selectedBarPeriod.value,
                style: AppTextStyles.title.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  /// ---------- MAIN CHART DATA ----------
  static BarChartData mainData(
    HomeController controller,
    BuildContext context,
  ) {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.blueGrey.withOpacity(0.9),
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final dollarAmount = controller.getDollarAmount(rod.toY);
            return BarTooltipItem(
              dollarAmount,
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            );
          },
        ),
        touchCallback: (event, barTouchResponse) {
          if (event is FlTapUpEvent &&
              barTouchResponse != null &&
              barTouchResponse.spot != null) {
            final index = barTouchResponse.spot!.touchedBarGroup.x.toInt();

            final profitList =
                (index >= 0 && index < controller.profitTrades.length)
                ? controller.profitTrades[index]
                : <String>[];

            final lossList =
                (index >= 0 && index < controller.lossTrades.length)
                ? controller.lossTrades[index]
                : <String>[];

            showDialog(
              context: context,
              builder: (_) => Dialog(
                backgroundColor: const Color(0xFF0F1720),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No of trades: ${profitList.length + lossList.length}',
                        style: AppTextStyles.title.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Profit: ${controller.formatCurrencyPositive(controller.getProfitAmountForIndex(index), includePlus: true)}',
                        style: AppTextStyles.title.copyWith(
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Loss: -${controller.formatCurrencyPositive(controller.getLossAmountForIndex(index))}',
                        style: AppTextStyles.title.copyWith(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),

      /// TITLES
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: (value, meta) {
              final labels = controller.getXAxisLabels();
              if (value.toInt() < labels.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    labels[value.toInt()],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                );
              }
              return const Text('');
            },
          ),
        ),
      ),

      /// GRID
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) => FlLine(
          color: const Color(0xFF344054).withOpacity(0.3),
          strokeWidth: 1,
          dashArray: const [5, 5],
        ),
      ),

      borderData: FlBorderData(show: false),

      /// BARS
      barGroups: _buildBarGroups(controller),

      minY: 0,
      maxY: controller.getMaxY(),
    );
  }

  /// ---------- BARS GENERATOR ----------
  static List<BarChartGroupData> _buildBarGroups(HomeController controller) {
    final groups = <BarChartGroupData>[];

    final profit = controller.profitSpots;
    final loss = controller.lossSpots;

    final itemCount = [
      profit.length,
      loss.length,
    ].reduce((a, b) => a < b ? a : b);

    for (var i = 0; i < itemCount; i++) {
      groups.add(
        BarChartGroupData(
          x: i,
          barsSpace: 6,
          barRods: [
            BarChartRodData(
              toY: profit[i],
              width: 12,
              color: const Color(0xFF12B76A),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            BarChartRodData(
              toY: loss[i],
              width: 12,
              color: const Color(0xFFF04438),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
          ],
        ),
      );
    }

    return groups;
  }
}
