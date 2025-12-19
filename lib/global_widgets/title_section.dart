import 'package:flutter/material.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;

  final double? titleSize;
  final double? subtitleSize;

  final Color titleColor;
  final Color subtitleColor;

  const TitleSection({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleSize,
    this.subtitleSize,
    this.titleColor = Colors.black,
    this.subtitleColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.title.copyWith(fontSize: 24)),

        const SizedBox(height: 4),

        Text(
          subtitle,

          style: AppTextStyles.title.copyWith(
            color: subtitleColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
