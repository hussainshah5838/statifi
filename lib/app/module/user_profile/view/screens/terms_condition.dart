import 'package:flutter/material.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../../../../global_widgets/appbar_header.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

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
              AppbarHeader(title: "Terms & Conditions"),

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
