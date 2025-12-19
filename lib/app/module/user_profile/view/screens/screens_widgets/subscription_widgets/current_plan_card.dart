import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/auth_button.dart';

class CurrentPlanCard extends StatelessWidget {
  const CurrentPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.tColor1.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(AppImages.premium3, width: 44),
              const SizedBox(width: 10),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Free trial\n',
                      style: AppTextStyles.title.copyWith(fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Your free trial will expire in 2 days.',
                      style: AppTextStyles.body.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),

              Spacer(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.textGreen.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Active',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textGreen,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),

                child: LinearProgressIndicator(
                  value: 1.0,
                  backgroundColor: Colors.grey,
                  color: Colors.grey,
                  minHeight: 7,
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),

                child: LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Colors.transparent,
                  color: AppColors.textAmber,
                  minHeight: 7,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subscribed : May 23, 2025',
                style: AppTextStyles.body.copyWith(fontSize: 12),
              ),
              Text(
                '1 / 3 days used ',
                style: AppTextStyles.body.copyWith(fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.tColor1,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Cancel',
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.tColor1,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Auto Renewal On',
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textAmber,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
