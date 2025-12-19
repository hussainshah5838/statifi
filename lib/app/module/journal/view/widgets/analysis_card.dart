import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../global_widgets/app_textstyle.dart';

class AnalysisCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? txtColor;
  final Color? bgColor;
  final double? titleSize;

  const AnalysisCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.txtColor,
    this.bgColor,
    this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 55) / 2,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.tColor1.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.title.copyWith(
              fontSize: titleSize ?? 14,
              color: txtColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: AppTextStyles.body.copyWith(fontSize: 12)),
        ],
      ),
    );
  }
}
