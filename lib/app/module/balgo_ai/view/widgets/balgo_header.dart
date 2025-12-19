import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/balgo_ai/controller/balgo_ai_controller.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class BalgoHeader extends StatelessWidget {
  const BalgoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BalgoAiController());

    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(AppImages.balgo, width: 35),
                    const SizedBox(width: 5),
                    Image.asset(AppImages.statifi, width: 80),
                  ],
                ),
                const SizedBox(height: 10),

                Text(
                  'Get personalized insights and analysis.',
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.textGreen.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.textGreen),
              ),
              child: Text(
                '•  Active',
                style: AppTextStyles.title.copyWith(
                  color: AppColors.textGreen,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // -------------------------------
        // 🔥 SWITCH CONTAINER
        // -------------------------------
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
          decoration: BoxDecoration(
            color: AppColors.tColor1.withOpacity(0.25),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              // Image
              Image.asset(AppImages.notifications, width: 35),
              const SizedBox(width: 12),

              // RichTexts
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "High Impact News alerts\n",
                      style: AppTextStyles.title.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: "Get Notified about market events.",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Switch
              Obx(
                () => Switch(
                  value: controller.isBalgoOn.value,
                  onChanged: controller.toggleBalgo,
                  activeTrackColor: AppColors.textAmber,
                  activeThumbColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
