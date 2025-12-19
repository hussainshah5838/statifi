import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class GoogleContinueButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const GoogleContinueButton({
    super.key,
    required this.onTap,
    this.text = 'Continue with Google',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 53,
        decoration: BoxDecoration(
          color: AppColors.tColor1,
          borderRadius: BorderRadius.circular(14),
          // border: Border.all(color: AppColors.textPrimary, width: 1.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.google, width: 24, height: 24),
            const SizedBox(width: 12),
            Text(
              text,
              style: AppTextStyles.heading2.copyWith(
                color: AppColors.textWhite,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
