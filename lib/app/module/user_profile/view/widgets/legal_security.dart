import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/user_profile/view/screens/privacy_policy.dart';
import 'package:statifi/app/module/user_profile/view/screens/security_policy.dart';
import 'package:statifi/app/module/user_profile/view/screens/terms_condition.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../global_widgets/app_textstyle.dart';

class LegalSecurity extends StatelessWidget {
  const LegalSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'LEGAL & SECURITY',
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
                  Get.to(SecurityPolicy());
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.securityPolicy, width: 20),
                    const SizedBox(width: 10),
                    Text(
                      'Security Policy',
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
                  Get.to(TermsCondition());
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.termsConditions, width: 20),
                    const SizedBox(width: 10),
                    Text(
                      'Terms & Conditions',
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
                  Get.to(PrivacyPolicy());
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.info, width: 20, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      'Privacy Police',
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
