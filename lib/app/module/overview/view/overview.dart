import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/overview/view/widgets/richtext_switch_row.dart';
import 'package:statifi/core/constants/app_texts.dart';
import 'package:statifi/global_widgets/appbar_header.dart';
import 'package:statifi/global_widgets/app_background.dart';
import 'package:statifi/app/module/overview/controller/overview_controller.dart';

class Overview extends StatelessWidget {
  Overview({super.key});

  // GetX controller
  final OverviewController controller = Get.put(OverviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                AppbarHeader(title: AppText.customizeDashboard),
                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF293645).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Obx(
                        () => RichTextSwitchRow(
                          title: AppText.performanceAnalytics,
                          subtitle: AppText.realTimePnL,
                          value: controller.isPerformanceEnabled.value,
                          onChanged: (val) => controller.togglePerformance(val),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Obx(
                        () => RichTextSwitchRow(
                          title: AppText.totalPL,
                          subtitle: AppText.realTimePL,
                          value: controller.isTotalPLEnabled.value,
                          onChanged: (val) => controller.toggleTotalPL(val),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Obx(
                        () => RichTextSwitchRow(
                          title: AppText.winRate,
                          subtitle: AppText.winRateDescription,
                          value: controller.isWinRateEnabled.value,
                          onChanged: (val) => controller.toggleWinRate(val),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Obx(
                        () => RichTextSwitchRow(
                          title: AppText.riskValue,
                          subtitle: AppText.riskValueDescription,
                          value: controller.isRiskValueEnabled.value,
                          onChanged: (val) => controller.toggleRiskValue(val),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Obx(
                        () => RichTextSwitchRow(
                          title: AppText.rewardValue,
                          subtitle: AppText.rewardValueDescription,
                          value: controller.isRewardValueEnabled.value,
                          onChanged: (val) => controller.toggleRewardValue(val),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Obx(
                        () => RichTextSwitchRow(
                          title: AppText.avgHoldTime,
                          subtitle: AppText.avgHoldTimeDescription,
                          value: controller.isAvgHoldTimeEnabled.value,
                          onChanged: (val) => controller.toggleAvgHoldTime(val),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Obx(
                        () => RichTextSwitchRow(
                          title: AppText.profitFactor,
                          subtitle: AppText.profitFactorDescription,
                          value: controller.isProfitFactorEnabled.value,
                          onChanged: (val) =>
                              controller.toggleProfitFactor(val),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Obx(
                        () => RichTextSwitchRow(
                          title: AppText.bestTrade,
                          subtitle: AppText.bestTradeDescription,
                          value: controller.isBestTradeEnabled.value,
                          onChanged: (val) => controller.toggleBestTrade(val),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Obx(
                        () => RichTextSwitchRow(
                          title: AppText.maxDrawdown,
                          subtitle: AppText.maxDrawdownDescription,
                          value: controller.isMaxDrawdownEnabled.value,
                          onChanged: (val) => controller.toggleMaxDrawdown(val),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Obx(
                        () => RichTextSwitchRow(
                          title: AppText.connectTradingPlatforms,
                          subtitle: AppText.connectTradingPlatformsDescription,
                          value:
                              controller.isConnectTradingPlatformsEnabled.value,
                          onChanged: (val) =>
                              controller.toggleConnectTradingPlatforms(val),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
