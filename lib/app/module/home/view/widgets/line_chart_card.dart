import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import '../../controller/home_controller.dart';
import 'mini_widgets/line_chart_helper.dart';

class LineChartCard extends StatelessWidget {
  LineChartCard({super.key});

  final List<Color> gradientColors = [
    const Color(0xff36CFE6).withOpacity(0.5),
    const Color(0xff36CFE6).withOpacity(0.1),
  ];

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xFF29364580),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Performance Analytics", style: AppTextStyles.title),
                    const SizedBox(height: 2),
                    Text(
                      "Real-time P&L tracking and insights.",
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
              ),

              _dropdown(controller),
            ],
          ),
          const SizedBox(height: 20),

          Obx(
            () => SizedBox(
              height: 220,
              child: LineChart(
                LineChartDataHelper.mainData(controller.spots, gradientColors),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdown(HomeController controller) {
    return GestureDetector(
      onTap: () {
        // Cycle only the line chart period
        if (controller.selectedLinePeriod.value == "This Week") {
          controller.changeLinePeriod("Last Week");
        } else if (controller.selectedLinePeriod.value == "Last Week") {
          controller.changeLinePeriod("This Month");
        } else {
          controller.changeLinePeriod("This Week");
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0x29364580),
          border: Border.all(color: Colors.white10, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Obx(
              () => Text(
                controller.selectedLinePeriod.value,
                style: AppTextStyles.title.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 25,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
