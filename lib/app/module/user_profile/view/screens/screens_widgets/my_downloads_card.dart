import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_images.dart';
import '../../../../../../global_widgets/app_textstyle.dart';

class MyDownloadsCard extends StatelessWidget {
  const MyDownloadsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.tColor1.withOpacity(0.4),
      ),
      child: Row(
        children: [
          Image.asset(AppImages.myDownloads, width: 45),

          const SizedBox(width: 10),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Trading Signals\n",
                  style: AppTextStyles.title.copyWith(fontSize: 15),
                ),
                WidgetSpan(child: const SizedBox(height: 18)),
                TextSpan(
                  text: "1.2 mb",
                  style: AppTextStyles.body.copyWith(fontSize: 12.5),
                ),
              ],
            ),
          ),

          Spacer(),

          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.textAmber.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.textAmber, width: 1.5),
            ),
            child: Text(
              'Download',
              style: AppTextStyles.title.copyWith(
                fontSize: 15,
                color: AppColors.textAmber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
