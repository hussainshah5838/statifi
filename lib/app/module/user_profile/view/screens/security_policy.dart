import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_texts.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/appbar_header.dart';

import '../../../../../global_widgets/app_background.dart';

class SecurityPolicy extends StatelessWidget {
  const SecurityPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          width: context.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarHeader(title: "Security Policy"),

              const SizedBox(height: 20),

              Text('Last updated Dec 23,2035', style: AppTextStyles.body),
              const SizedBox(height: 5),
              Text(
                'Introduction',
                style: AppTextStyles.title.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 5),
              Text(AppText.intro1, style: AppTextStyles.body),

              const SizedBox(height: 10),

              Text(
                'Introduction',
                style: AppTextStyles.title.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 5),
              Text(AppText.intro2, style: AppTextStyles.body),
            ],
          ),
        ),
      ),
    );
  }
}
