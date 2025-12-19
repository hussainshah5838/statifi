import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/auth_button.dart';

import '../../controller/journal_controller.dart';
import 'analysis_card.dart';

class AnalyzeProfile extends StatelessWidget {
  const AnalyzeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    final screenHeight = MediaQuery.of(context).size.height;
    final JournalController controller = Get.find<JournalController>();

    final List<String> tickItems = [
      'Trade Setup Ready',
      'Risk Management Applied',
      'Target Achievable',
    ];

    return Container(
      width: double.infinity,
      height: bottomInsets > 0 ? screenHeight * 0.92 : screenHeight * 0.91,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color(0xFF0C121A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 43,
              height: 5,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                const AnalysisCard(
                  title: '5m, 15m, 30m',
                  subtitle: 'Timeframes',
                ),
                const AnalysisCard(
                  title: 'GBPUSD, EURUSD',
                  subtitle: 'Best Pairs',
                ),
                AnalysisCard(
                  title: '85%',
                  subtitle: 'Profitability',
                  txtColor: AppColors.textGreen,
                ),
                const AnalysisCard(title: 'Medium', subtitle: 'Risk Level'),
              ],
            ),
          ),

          const SizedBox(height: 5),
          Divider(color: AppColors.tColor1.withOpacity(0.4)),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.tColor1.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why this strategy matches you:',
                  style: AppTextStyles.title.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.textAmber,
                  ),
                ),
                const SizedBox(height: 10),
                ...tickItems.map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: _buildTickCard(text),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),
          Divider(color: AppColors.tColor1.withOpacity(0.4)),
          const SizedBox(height: 5),

          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                const AnalysisCard(title: '245', subtitle: 'Total Trades'),
                AnalysisCard(
                  title: '55%',
                  subtitle: 'Win Rate',
                  txtColor: AppColors.textGreen,
                ),
                AnalysisCard(
                  title: '\$42.4',
                  subtitle: 'Avg. Profit',
                  txtColor: AppColors.textAmber,
                ),
                const AnalysisCard(
                  title: '12.5%',
                  subtitle: 'Max Drawdown',
                  txtColor: Colors.red,
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),
          Divider(color: AppColors.tColor1.withOpacity(0.4)),
          const SizedBox(height: 5),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.tColor1.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why this strategy matches you:',
                  style: AppTextStyles.title.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.textAmber,
                  ),
                ),
                const SizedBox(height: 10),
                ...tickItems.map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: _buildTickCard(text),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),
          Divider(color: AppColors.tColor1.withOpacity(0.4)),
          const SizedBox(height: 5),

          AuthButton(
            text: "Done",
            onTap: () {
              controller.showRecommendedStrategies();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTickCard(String text) {
    return Row(
      children: [
        Image.asset(AppImages.checkMark, width: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(text, style: AppTextStyles.body.copyWith(fontSize: 12)),
        ),
      ],
    );
  }
}
