import 'package:flutter/material.dart';

import 'app_textstyle.dart';

class AuthHeader extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, width: 150, height: 150),
        const SizedBox(height: 20),

        Text(title, style: AppTextStyles.title, textAlign: TextAlign.center),

        const SizedBox(height: 8),

        Text(subtitle, style: AppTextStyles.body, textAlign: TextAlign.center),
        const SizedBox(height: 10),
      ],
    );
  }
}
