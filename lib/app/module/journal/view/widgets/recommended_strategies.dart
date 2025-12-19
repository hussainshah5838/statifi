import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statifi/global_widgets/profile_drawer.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/extentions/custom_painters.dart';
import '../../../../../global_widgets/app_textstyle.dart';

class RecommendedStrategies extends StatelessWidget {
  final bool showRecommendations;
  final VoidCallback? onAnalyzeProfile; // Add callback

  const RecommendedStrategies({
    super.key,
    required this.showRecommendations,
    this.onAnalyzeProfile, // Make it optional
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.tColor1.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AppImages.ranking, width: 24),
              const SizedBox(width: 10),
              Text(
                'Recommended Strategies',
                style: AppTextStyles.title.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 25),

          if (!showRecommendations)
            _buildEmptyState(context) // Pass context here
          else
            _buildRecommendedPlaceholder(context),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Image.asset(AppImages.notes, fit: BoxFit.contain, width: 60),
              const SizedBox(height: 20),
              Text(
                'Connect trading platforms or add manual trades to get personalized recommendations.',
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Center(
          child: GestureDetector(
            onTap:
                onAnalyzeProfile ??
                () {
                  AppDialogs.analyzeProfileSheet(context: context);
                },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: 125,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.textAmber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Analyze Profile',
                  style: AppTextStyles.body.copyWith(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedPlaceholder(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              AppDialogs.analyzeProfileSheet(context: context);
            },
            child: Container(
              alignment: Alignment.center,
              height: 47,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: AppColors.textAmber.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: DottedBorder(
                  color: AppColors.textAmber.withOpacity(0.7),
                  strokeWidth: 1.5,
                  dashWidth: 8.0,
                  dashGap: 4.0,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 1.5),
                  child: Text(
                    '+ Add Strategy note',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.title.copyWith(
                      fontSize: 14,
                      color: AppColors.textAmber.withOpacity(0.9),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          _reportCard(
            title: 'Weekly Swing Trade...',
            subtitle: 'Medium-term swing trades holding for 3-7 days...',
            btnText: 'Medium',
            btnBorder: Colors.yellow,
            txtColor: Colors.yellow,
            btnContainer: Colors.yellow.withOpacity(0.1),
          ),

          const SizedBox(height: 8),

          _reportCard(
            title: 'EMA Trend Following',
            subtitle: 'Medium-term swing trades holding for 3-7 days...',
            btnText: 'Low',
            btnBorder: AppColors.textGreen,
            txtColor: AppColors.textGreen,
            btnContainer: AppColors.textGreen.withOpacity(0.1),
          ),

          const SizedBox(height: 8),

          _reportCard(
            title: 'Weekly Swing Trade...',
            subtitle: 'Medium-term swing trades holding for 3-7 days...',
            btnText: 'Medium',
            btnBorder: Colors.yellow,
            txtColor: Colors.yellow,
            btnContainer: Colors.yellow.withOpacity(0.1),
          ),
        ],
      ),
    );
  }

  Widget _reportCard({
    required String title,
    required String subtitle,
    required String btnText,
    required Color btnBorder,
    required Color txtColor,
    required Color btnContainer,
    String? pic,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black38,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(pic ?? AppImages.trade1, width: 24),

              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: btnContainer,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: btnBorder ?? Colors.yellow),
                ),
                child: Text(
                  btnText,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title.copyWith(
                    color: txtColor ?? CupertinoColors.systemYellow,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Title
          Text(title, style: AppTextStyles.title.copyWith(fontSize: 14)),

          const SizedBox(height: 3),

          /// Subtitle
          Text(subtitle, style: AppTextStyles.body.copyWith(fontSize: 12)),

          const SizedBox(height: 15),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.tColor1.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Match',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '50%',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textAmber,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 7,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.tColor1,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),

                      FractionallySizedBox(
                        widthFactor: 0.5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.textAmber,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Win: 52%',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(
                      height: 15,
                      width: 4,
                      child: VerticalDivider(
                        color: AppColors.tColor1.withOpacity(0.7),
                        width: 2,
                      ),
                    ),

                    Text(
                      'R:R 4.5:1',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(
                      height: 15,
                      width: 4,
                      child: VerticalDivider(
                        color: AppColors.tColor1.withOpacity(0.7),
                        width: 2,
                      ),
                    ),

                    Text(
                      '4H',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Container(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
