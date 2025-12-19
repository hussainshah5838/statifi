import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/app/module/user_profile/controller/notification_settings_controller.dart';
import 'package:statifi/app/module/user_profile/view/screens/screens_widgets/notification_settings/notification_platform_settings.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/auth_button.dart';
import 'screens_widgets/notification_settings/notification_ai_analysis.dart';
import 'screens_widgets/notification_settings/notification_trading_alert.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationSettingsController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          width: context.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarHeader(title: "Notification Settings"),

                const SizedBox(height: 20),

                Container(
                  width: context.screenWidth,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.tColor1.withOpacity(0.4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // platform settings
                      NotificationPlatformSettings(),

                      const SizedBox(height: 10),
                      Divider(color: AppColors.tColor1),
                      const SizedBox(height: 10),

                      NotificationTradingAlert(),

                      const SizedBox(height: 10),
                      Divider(color: AppColors.tColor1),
                      const SizedBox(height: 10),

                      NotificationAiAnalysis(),

                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: AuthButton(
                              text: "Cancel",
                              color: AppColors.tColor1.withOpacity(0.4),
                              txtColor: AppColors.textPrimary,

                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AuthButton(
                              text: "Save Changes",
                              onTap: () {},
                            ),
                          ),
                        ],
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
