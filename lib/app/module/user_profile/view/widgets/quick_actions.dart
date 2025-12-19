import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/app/module/user_profile/view/screens/change_password.dart';
import 'package:statifi/app/module/user_profile/view/screens/edit_profile.dart';
import 'package:statifi/app/module/user_profile/view/screens/my_downloads.dart';
import 'package:statifi/app/module/user_profile/view/screens/notification_settings.dart';
import 'package:statifi/app/module/user_profile/view/screens/trading_preferences.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'QUICK ACTIONS',
          style: AppTextStyles.title.copyWith(color: Colors.grey, fontSize: 12),
        ),

        const SizedBox(height: 15),

        Container(
          padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.tColor1.withOpacity(0.4),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(ChangePassword());
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.changePassword, width: 20),
                    const SizedBox(width: 10),
                    Text(
                      'Change Password',
                      style: AppTextStyles.title.copyWith(fontSize: 14),
                    ),

                    Spacer(),

                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 22,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Divider(color: AppColors.tColor1),
              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Get.to(TradingPreferences());
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.settings2, width: 20),
                    const SizedBox(width: 10),
                    Text(
                      'Trading Preferences',
                      style: AppTextStyles.title.copyWith(fontSize: 14),
                    ),

                    Spacer(),

                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 22,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Divider(color: AppColors.tColor1),
              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Get.to(NotificationSettings());
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.notificationIcon, width: 20),
                    const SizedBox(width: 10),
                    Text(
                      'Notification Settings',
                      style: AppTextStyles.title.copyWith(fontSize: 14),
                    ),

                    Spacer(),

                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 22,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Divider(color: AppColors.tColor1),
              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Get.to(MyDownloads());
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.download, width: 20),
                    const SizedBox(width: 10),
                    Text(
                      'My Downloads',
                      style: AppTextStyles.title.copyWith(fontSize: 14),
                    ),

                    Spacer(),

                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 22,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
