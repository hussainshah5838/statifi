import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_sizes.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class CustomBottomSheet {
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

                  // 🔹 Image
                  Image.asset(imagePath, height: 140),
                  const SizedBox(height: 20),

                  // 🔹 Title
                  Text(
                    title,
                    style: AppTextStyles.heading1.copyWith(
                      color: AppColors.textWhite,
                      fontSize: AppSizes.fontLarge,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),

                  // 🔹 Subtitle
                  Text(
                    subtitle1,
                    style: AppTextStyles.body,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  // 🔹 Button
                  AuthButton(text: buttonText, onTap: onButtonTap),

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
