import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class BalgoAiInsightsSheet extends StatelessWidget {
  const BalgoAiInsightsSheet({super.key});

  // Static helper method to show the bottom sheet
  static void show({required BuildContext context}) {
    final screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: screenHeight * 0.55,
          decoration: const BoxDecoration(
            color: Color(0xFF0C121A),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: const BalgoAiInsightsSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.screeHeight * 0.59,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(color: Color(0xFF0C121A)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 3),

          Center(
            child: Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'Recent BALGO AI Insights',
            style: AppTextStyles.title.copyWith(fontSize: 20),
          ),

          const SizedBox(height: 20),

          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.tColor1.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 13,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.textGreen.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.textGreen),
                      ),
                      child: Text(
                        'Comprehensive Report',
                        style: AppTextStyles.title.copyWith(
                          color: AppColors.textGreen,
                          fontSize: 13,
                        ),
                      ),
                    ),

                    const SizedBox(width: 5),

                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 13,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.textRed.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.textRed),
                      ),
                      child: Text(
                        'Delete',
                        style: AppTextStyles.title.copyWith(
                          color: AppColors.textRed,
                          fontSize: 13,
                        ),
                      ),
                    ),

                    Spacer(),

                    Text(
                      '9/17/2025',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '#Comprehensive Trading Overview Report\n',
                        style: AppTextStyles.title.copyWith(fontSize: 15),
                      ),

                      WidgetSpan(child: const SizedBox(height: 25)),

                      TextSpan(
                        text:
                            'Given that there’s no specific trading data available, i’ll provide a general framework and insights that can be adapted to your situation. This will include key patterns, areas for improvement, actionable recommendations, risk management, insights and a market outlook for major forex pairs.',
                        style: AppTextStyles.body.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                Divider(color: AppColors.tColor1),
                const SizedBox(height: 15),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '1. Key Patterns in tradings\n',
                        style: AppTextStyles.title.copyWith(
                          fontSize: 15,
                          color: AppColors.textAmber,
                        ),
                      ),

                      WidgetSpan(child: const SizedBox(height: 25)),

                      TextSpan(
                        text:
                            "Without specific data, consider the following common patterns many traders encounter.",
                        style: AppTextStyles.body.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  'View full report for complete analysis',
                  style: AppTextStyles.title.copyWith(
                    fontSize: 13,
                    color: AppColors.textAmber,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.textAmber,
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
