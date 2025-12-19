import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../global_widgets/app_textstyle.dart';
import '../../../../controller/notification_settings_controller.dart';

class NotificationPlatformSettings extends StatelessWidget {
  const NotificationPlatformSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationSettingsController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Platform Settings",
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
                      text: "Email Notifications\n",
                      style: AppTextStyles.title.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: "Receive notifications via email",
                      style: AppTextStyles.body.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            Obx(
              () => Switch(
                value: controller.email.value,
                activeThumbColor: Colors.black,
                activeTrackColor: AppColors.textAmber,
                onChanged: (val) {
                  controller.email.value = val;
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
                      text: "Push Notifications\n",
                      style: AppTextStyles.title.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: "Browse push notifications",
                      style: AppTextStyles.body.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            Obx(
              () => Switch(
                value: controller.push.value,
                activeThumbColor: Colors.black,
                activeTrackColor: AppColors.textAmber,
                onChanged: (val) {
                  controller.push.value = val;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
