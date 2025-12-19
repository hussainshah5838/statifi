import 'package:flutter/material.dart';
import 'package:statifi/global_widgets/profile_drawer.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../global_widgets/app_textstyle.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.textAmber.withOpacity(0.2),
          child: Image.asset(AppImages.drawer2),
        ),
        const SizedBox(width: 10),

        // Pair name + price + percent change
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gold Spot / U.S. Dollar",
              style: AppTextStyles.title.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                Text(
                  "4,181.915  +39.880  (+0.96%)",
                  style: AppTextStyles.body.copyWith(
                    fontSize: 14,
                    color: AppColors.textGreen,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),

        // DROPDOWN (USD)
        GestureDetector(
          onTap: () {
            AppDialogs.tradeSheet(context: context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  "USD",
                  style: AppTextStyles.title.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
