import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/subscription_plans/controller/subscription_plan_controller.dart';
import 'package:statifi/app/module/subscription_plans/view/screens/payment_method.dart';
import 'package:statifi/app/module/subscription_plans/view/widgets/plan_card.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';
import 'package:statifi/routes/app_routes.dart';

import '../../../../global_widgets/app_background.dart';
import '../../../../global_widgets/app_textstyle.dart';

class SubscriptionPlanView extends GetView<SubscriptionPlanController> {
  const SubscriptionPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppbarHeader(title: 'Subscription Plans'),

                const SizedBox(height: 15),

                Text(
                  'Subscription Plans',
                  style: AppTextStyles.title.copyWith(fontSize: 24),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Take benefits from our amazing and affordable subscription plans',
                  style: AppTextStyles.body,
                ),

                const SizedBox(height: 20),

                PlanCard(
                  title: 'Premium',
                  price: 59.99,
                  includes: [
                    "All Features",
                    "Unlimited Accounts",
                    "Full access to AI Strategy analysis",
                    "Trade notification alerts / Price target alerts",
                    "Full access to AI-driven psychology analysis",
                  ],
                  onTap: () => Get.to(PaymentMethod()),
                ),

                const SizedBox(height: 15),

                PlanCard(
                  title: 'Plus',
                  price: 59.99,
                  includes: [
                    "Up to 3 account",
                    "Push notification news alerts",
                    "High impact news analysis reports",
                    "Trade notification alerts / Price target alerts",
                    "AI-driven psychology analysis",
                  ],
                  onTap: () => Get.to(PaymentMethod()),
                ),

                const SizedBox(height: 15),

                PlanCard(
                  title: 'Basic',
                  price: 59.99,
                  includes: [
                    "Upto only 1 account",
                    "General journal reporting",
                    "AI Strategy analysis",
                  ],
                  onTap: () => Get.to(PaymentMethod()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
