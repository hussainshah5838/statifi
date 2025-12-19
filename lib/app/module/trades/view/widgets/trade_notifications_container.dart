import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../global_widgets/app_textstyle.dart';

class TradeNotificationsContainer extends StatelessWidget {
  const TradeNotificationsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.darkGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(AppImages.notifications, color: Colors.white, width: 25),

          const SizedBox(width: 10),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Trade Notifications\n",
                  style: AppTextStyles.title.copyWith(fontSize: 16),
                ),
                TextSpan(
                  text: " Real-Time alerts and price targets.",
                  style: AppTextStyles.body.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),

          Spacer(),

          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.textGreen, width: 1.0),
            ),
            child: Row(
              children: [
                Image.asset(
                  AppImages.notifications,
                  color: AppColors.textGreen,
                  width: 15,
                ),
                const SizedBox(width: 5),
                Text(
                  'Enable',
                  style: AppTextStyles.body.copyWith(
                    fontSize: 12,
                    color: AppColors.textGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
