import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/app/module/user_profile/view/screens/app_history.dart';
import 'package:statifi/app/module/user_profile/view/screens/contact_support.dart';
import 'package:statifi/routes/app_routes.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/app_texts.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../../../../global_widgets/custom_bottom_sheet.dart';
import '../screens/help_center.dart';

class AppInformation extends StatelessWidget {
  const AppInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'APP INFORMATION',
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
                  Get.to(AppHistory());
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.appHistory, width: 20),
                    const SizedBox(width: 10),
                    Text(
                      'App History',
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
                onTap: () => Get.to(ContactSupport()),
                child: Row(
                  children: [
                    Image.asset(AppImages.contact, width: 20),
                    const SizedBox(width: 10),
                    Text(
                      'Contact Support',
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
                  Get.to(HelpCenterScreen());
                },
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.setting,
                      width: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Help Center',
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
                  CustomBottomSheet.show(
                    context: context,
                    imagePath: AppImages.logout2,
                    title: AppText.logOut2,
                    subtitle1: AppText.logOutSubtitle,
                    buttonText: AppText.yesLogout,
                    onButtonTap: () {
                      Get.offAllNamed(AppRoutes.login);
                    },
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.login,
                      width: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Logout',
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
