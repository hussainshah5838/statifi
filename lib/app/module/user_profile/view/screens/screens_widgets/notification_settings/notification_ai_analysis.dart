import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../global_widgets/app_textstyle.dart';
import '../../../../controller/notification_settings_controller.dart';

class NotificationAiAnalysis extends StatelessWidget {
  const NotificationAiAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationSettingsController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "AI & Analysis",
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
                      text: "AI Insight Emails\n",
                      style: AppTextStyles.title.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: "Receive BALGO AI analysis via email",
                      style: AppTextStyles.body.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            Obx(
              () => Switch(
                value: controller.ai.value,
                activeThumbColor: Colors.black,
                activeTrackColor: AppColors.textAmber,
                onChanged: (val) {
                  controller.ai.value = val;
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
                      text: "Economic News Alert\n",
                      style: AppTextStyles.title.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: "High-impact forex news notifications",
                      style: AppTextStyles.body.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            Obx(
              () => Switch(
                value: controller.economic.value,
                activeThumbColor: Colors.black,
                activeTrackColor: AppColors.textAmber,
                onChanged: (val) {
                  controller.economic.value = val;
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
                      text: "Weekly performance reports\n",
                      style: AppTextStyles.title.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: "Weekly trading performance summaries.",
                      style: AppTextStyles.body.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            Obx(
              () => Switch(
                value: controller.report.value,
                activeThumbColor: Colors.black,
                activeTrackColor: AppColors.textAmber,
                onChanged: (val) {
                  controller.report.value = val;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
