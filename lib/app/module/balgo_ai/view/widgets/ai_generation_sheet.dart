import 'package:flutter/material.dart';
import 'package:statifi/app/module/balgo_ai/view/widgets/balgo_ai_insights_sheet.dart';
import 'package:statifi/core/constants/app_images.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../../../../global_widgets/auth_button.dart';
import 'animated_ai_image.dart';

class AiGenerationSheet {
  static void show({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String subtitle1,
    required String buttonText,
    required VoidCallback onButtonTap,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgColor1,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;
        final minHeight = 430.0;
        final maxHeight = screenHeight * 0.92;

        return Container(
          decoration: const BoxDecoration(
            color: AppColors.bgColor1,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              // controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 11),

                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  const SizedBox(height: 50),

                  AnimatedAiImage(imagePath: imagePath),

                  // 🔹 Title
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.statifi, width: 40),
                      const SizedBox(width: 5),
                      Text(
                        title,
                        style: AppTextStyles.heading1.copyWith(
                          color: AppColors.textWhite,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // 🔹 Subtitle
                  Text(
                    subtitle1,
                    style: AppTextStyles.body,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  // 🔹 Linear Container
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(seconds: 5),
                      curve: Curves.linear,
                      builder: (context, value, child) {
                        if (value >= 1.0) {
                          Navigator.pop(context);

                          Future.delayed(const Duration(milliseconds: 100), () {
                            BalgoAiInsightsSheet.show(context: context);
                          });
                        }

                        return Container(
                          width: double.infinity,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),

                              // Animated filling container
                              FractionallySizedBox(
                                widthFactor: value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.textAmber,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🔹 Button
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
