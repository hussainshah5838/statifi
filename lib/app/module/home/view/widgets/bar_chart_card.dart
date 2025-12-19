import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import 'mini_widgets/bar_chart_helper.dart';

class BarChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(() {
      final net =
          controller.totalProfitForBarPeriod() -
          controller.totalLossForBarPeriod();
      final isProfit = net >= 0;

      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isProfit
              ? const Color(0xFF49DD7F).withOpacity(0.03)
              : const Color(0xFFFEF2F2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _header(controller, isProfit),
                BarChartHelpers.buildDropdown(controller),
              ],
            ),

            const SizedBox(height: 20),

            /// Chart
            SizedBox(
              height: 220,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 56),
                    child: BarChart(
                      BarChartHelpers.mainData(controller, context),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BarChartHelpers.buildYAxisLabel("\$200k"),
                        BarChartHelpers.buildYAxisLabel("\$100k"),
                        BarChartHelpers.buildYAxisLabel("\$75k"),
                        BarChartHelpers.buildYAxisLabel("\$50k"),
                        BarChartHelpers.buildYAxisLabel("\$10k"),
                        BarChartHelpers.buildYAxisLabel("\$0k"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _header(HomeController controller, bool isProfit) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Weekly Breakdown"),
          Obx(
            () => Text(
              "+ ${controller.totalPnL.value}",
              style: TextStyle(
                color: isProfit ? Colors.green : Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
