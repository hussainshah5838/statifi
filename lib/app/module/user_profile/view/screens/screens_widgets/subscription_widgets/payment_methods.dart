import 'dart:math';

import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_images.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../global_widgets/app_textstyle.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.tColor1.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Mastercard ***56\n',
                  style: AppTextStyles.title.copyWith(fontSize: 16),
                ),
                TextSpan(
                  text: 'Expiry date: 05/29',
                  style: AppTextStyles.body.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),

          Spacer(),

          Container(
            padding: EdgeInsets.all(10),
            width: 33,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.red, width: 1),
            ),
            child: Image.asset(AppImages.dltIcon, fit: BoxFit.contain),
          ),
          const SizedBox(width: 5),
          Container(
            padding: EdgeInsets.all(8),
            width: 33,
            height: 35,
            decoration: BoxDecoration(
              color: AppColors.textAmber.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.textAmber, width: 1),
            ),
            child: Image.asset(AppImages.etdIcon, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
