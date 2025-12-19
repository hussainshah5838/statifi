import 'package:flutter/material.dart';

import 'app_textstyle.dart';

class CommonHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const CommonHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.title),

        const SizedBox(height: 8),

        Text(subtitle, style: AppTextStyles.body),
        const SizedBox(height: 10),
      ],
    );
  }
}
