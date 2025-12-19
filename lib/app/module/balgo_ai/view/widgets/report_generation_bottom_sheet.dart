import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/auth_button.dart';

class ReportGenerationBottomSheet extends StatelessWidget {
  final String title;
  final String timeFrameText;
  final String timeText;
  final String reportInclude;
  final List<String> reportList;
  final VoidCallback? onTap;

  const ReportGenerationBottomSheet({
    super.key,
    required this.title,
    required this.timeFrameText,
    required this.timeText,
    required this.reportInclude,
    required this.reportList,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.screeHeight * 0.59,
      padding: EdgeInsets.all(15),
      decoration: const BoxDecoration(color: Color(0xFF0C121A)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              // 'Generate Comprehensive Trading Report',
              title,
              style: AppTextStyles.title.copyWith(fontSize: 20),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            // 'News analysis Timeframe',
            timeFrameText,

            style: AppTextStyles.body,
          ),

          const SizedBox(height: 10),

          Container(
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: AppColors.tColor1.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // 'Weekly Report',
                  timeText,
                  style: AppTextStyles.title.copyWith(fontSize: 14),
                ),

                Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 25),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: AppColors.tColor1.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reportInclude,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textAmber,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 15),

                ...reportList.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppImages.checkMark, width: 20),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            item,
                            style: AppTextStyles.body.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Spacer(),
          AuthButton(text: 'Generate Report', onTap: onTap ?? () {}),
        ],
      ),
    );
  }
}
