import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/app/module/user_profile/view/screens/add_new_card.dart';
import 'package:statifi/app/module/user_profile/view/screens/screens_widgets/subscription_widgets/current_plan_card.dart';
import 'package:statifi/app/module/user_profile/view/screens/screens_widgets/subscription_widgets/payment_methods.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/appbar_header.dart';
import 'package:statifi/global_widgets/auth_button.dart';

import '../../../../../global_widgets/app_background.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarHeader(title: "Subscription"),

              const SizedBox(height: 20),

              Text(
                'CURRENT PLAN',
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.textPrimary.withOpacity(0.5),
                ),
              ),

              const SizedBox(height: 15),

              CurrentPlanCard(),

              const SizedBox(height: 15),

              Text(
                'PAYMENT METHODS',
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.textPrimary.withOpacity(0.5),
                ),
              ),

              const SizedBox(height: 15),

              PaymentMethods(),

              Spacer(),

              AuthButton(
                text: 'Add new card',
                onTap: () {
                  Get.to(AddNewCard());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
