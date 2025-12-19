import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/app/module/subscription_plans/view/subscription_plan_view.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/routes/app_routes.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../global_widgets/app_textstyle.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.textAmber,
      ),
      child: Row(
        children: [
          Image.asset(AppImages.premium2, width: 45, height: 45),

          const SizedBox(width: 10),

          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Premium Member\n",
                    style: AppTextStyles.title.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  WidgetSpan(child: const SizedBox(height: 17)),
                  TextSpan(
                    text: "Member since August 2024",
                    style: AppTextStyles.body.copyWith(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Spacer(),
          GestureDetector(
            onTap: () => Get.to(() => SubscriptionPlanView()),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Text(
                'Manage',
                style: AppTextStyles.title.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
