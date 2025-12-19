import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class PaymentCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final double? width;
  final String title;
  final String img;

  const PaymentCard({
    super.key,
    required this.isSelected,
    required this.onTap,
    this.width,
    required this.title,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.textAmber.withOpacity(0.1)
              : AppColors.tColor1.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(color: AppColors.textAmber, width: 2)
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(img, width: 30),
                if (isSelected) Image.asset(AppImages.check, width: 25),
              ],
            ),
            const SizedBox(height: 15),
            Text(title, style: AppTextStyles.title.copyWith(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
