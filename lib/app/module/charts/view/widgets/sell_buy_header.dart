import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../global_widgets/app_textstyle.dart';

class SellBuyHeader extends StatelessWidget {
  const SellBuyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SELL
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red),
          ),
          child: Text(
            "4,182.110\nSELL",
            textAlign: TextAlign.center,
            style: AppTextStyles.title.copyWith(
              fontSize: 12,
              color: AppColors.textRed,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "67.0",
          style: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 10),

        // BUY
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: CupertinoColors.activeBlue),
          ),
          child: Text(
            "4,182.780\nBUY",
            textAlign: TextAlign.center,
            style: AppTextStyles.title.copyWith(
              fontSize: 12,
              color: CupertinoColors.activeBlue,
            ),
          ),
        ),
      ],
    );
  }
}
