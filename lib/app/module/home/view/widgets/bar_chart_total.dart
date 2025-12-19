import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import '../../controller/home_controller.dart';

class BarChartTotal extends StatelessWidget {
  const BarChartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(() {
      // compute net across the total period to determine overall profit/loss
      final net =
          controller.totalProfitForBarPeriod() -
          controller.totalLossForBarPeriod();
      final isProfit = net >= 0;
      final bgColor = isProfit
          ? const Color(0xFF49DD7F).withOpacity(0.03)
          : const Color(0xFFFEF2F2);

      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total P&L",
                      style: AppTextStyles.body.copyWith(
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isProfit
                          ? "+ ${controller.totalPnLTotal.value}"
                          : "- ${controller.totalPnLTotal.value}",
                      style: AppTextStyles.title.copyWith(
                        color: isProfit
                            ? const Color(0xFF009A3F)
                            : const Color(0xFFBA0000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // Period selector (separate for total chart)
                GestureDetector(
                  onTap: () {
                    final cur = controller.selectedBarTotalPeriod.value;
                    if (cur == "This Week") {
                      controller.changeTotalBarPeriod("Last Week");
                    } else if (cur == "Last Week") {
                      controller.changeTotalBarPeriod("This Month");
                    } else if (cur == "This Month") {
                      controller.changeTotalBarPeriod("Last Month");
                    } else {
                      controller.changeTotalBarPeriod("This Week");
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D2939),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white10, width: 1),
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            controller.selectedBarTotalPeriod.value,
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
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Chart area with aligned Y labels
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Y axis labels (match chart height)
                SizedBox(
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "\$200",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "\$100",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "\$75",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "\$50",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "\$10",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "\$0",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                // Bars
                Expanded(
                  child: SizedBox(
                    height: 220,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        barTouchData: BarTouchData(enabled: true),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                const style = TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                );
                                const days = [
                                  'Mon',
                                  'Tue',
                                  'Wed',
                                  'Thu',
                                  'Fri',
                                  'Sat',
                                  'Sun',
                                ];
                                if (value >= 0 && value < days.length) {
                                  return Text(
                                    days[value.toInt()],
                                    style: style,
                                  );
                                }
                                return const Text('');
                              },
                              reservedSize: 20,
                            ),
                          ),
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                          horizontalInterval: 2,
                          getDrawingHorizontalLine: (value) => FlLine(
                            color: const Color(0xFF344054).withOpacity(0.3),
                            strokeWidth: 1,
                            dashArray: [5, 5],
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        barGroups: List.generate(
                          controller.totalProfitSpots.length,
                          (index) {
                            final profit = controller.totalProfitSpots[index];
                            final loss =
                                (index < controller.totalLossSpots.length)
                                ? controller.totalLossSpots[index]
                                : 0.0;
                            final netDay = profit - loss;
                            return BarChartGroupData(
                              x: index,
                              barRods: [
                                BarChartRodData(
                                  toY: netDay.abs(),
                                  width: 30,
                                  color: netDay >= 0
                                      ? const Color(0xFF12B76A)
                                      : const Color(0xFFF04438),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        maxY: 10,
                        minY: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
