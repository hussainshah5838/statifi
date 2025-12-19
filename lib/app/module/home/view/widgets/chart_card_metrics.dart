import 'package:flutter/material.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

import '../../../../../core/constants/app_images.dart';

class ChartCardMetrics extends StatelessWidget {
  final String profitFactor;
  final String maxDrawdown;
  final String avgHoldTime;
  final int bestTrade;
  final int worstTrade;

  const ChartCardMetrics({
    super.key,
    this.profitFactor = "--",
    this.maxDrawdown = "--",
    this.avgHoldTime = "2h 45m",
    this.bestTrade = 5800,
    this.worstTrade = -2300,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _metricCard(
                iconImage: AppImages.time,
                title: 'Avg. Hold Time',
                value: avgHoldTime,
                textColor: Color(0xFF36CFE6),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _metricCard(
                iconImage: AppImages.chartUp,
                title: 'Profit Factor',
                value: profitFactor,
                textColor: const Color(0xFF20F32B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _metricCard(
                iconImage: AppImages.profit,
                title: 'Best Trade',
                value: '+\$${bestTrade.abs()}',
                textColor: const Color(0xFF12B76A),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _metricCard(
                iconImage: AppImages.loss,
                title: 'Max Drawdown',
                value: '\$${worstTrade.abs()}',
                textColor: const Color(0xFFF04438),
                bgColor: Color(0xFF452937).withOpacity(0.15),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _metricCard({
    required String title,
    required String value,
    required Color? textColor,
    required String? iconImage,
    Color? bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgColor ?? Color(0xFF0E1A1C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(iconImage!, width: 30, height: 30),
          const SizedBox(height: 7),

          Text(
            value,
            style: AppTextStyles.heading2.copyWith(
              fontSize: 20,
              color: textColor,
            ),
          ),

          const SizedBox(height: 6),

          Text(title, style: AppTextStyles.body.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
