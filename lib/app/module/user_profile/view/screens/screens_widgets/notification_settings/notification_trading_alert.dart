import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../global_widgets/app_textstyle.dart';
import '../../../../controller/notification_settings_controller.dart';

class NotificationTradingAlert extends StatelessWidget {
  const NotificationTradingAlert({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationSettingsController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Trading Alerts",
          style: AppTextStyles.title.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.textAmber,
          ),
        ),

        const SizedBox(height: 10),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Trade Execution Alerts\n",
                      style: AppTextStyles.title.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: "Notifications when trades are opened/closed",
                      style: AppTextStyles.body.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            Obx(
              () => Switch(
                value: controller.trade.value,
                activeThumbColor: Colors.black,
                activeTrackColor: AppColors.textAmber,
                onChanged: (val) {
                  controller.trade.value = val;
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Risk management Alerts\n",
                      style: AppTextStyles.title.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: "Alerts for high risk positions/drawdowns",
                      style: AppTextStyles.body.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            Obx(
              () => Switch(
                value: controller.risk.value,
                activeThumbColor: Colors.black,
                activeTrackColor: AppColors.textAmber,
                onChanged: (val) {
                  controller.risk.value = val;
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Market Hours Notifications\n",
                      style: AppTextStyles.title.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: "Alerts for market open/close times.",
                      style: AppTextStyles.body.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            Obx(
              () => Switch(
                value: controller.market.value,
                activeThumbColor: Colors.black,
                activeTrackColor: AppColors.textAmber,
                onChanged: (val) {
                  controller.market.value = val;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
