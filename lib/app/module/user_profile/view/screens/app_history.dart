import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/appbar_header.dart';

class AppHistory extends StatelessWidget {
  const AppHistory({super.key});

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
            children: [
              AppbarHeader(title: "App History"),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Version", style: AppTextStyles.body),
                  Text(
                    "1.0.0",
                    style: AppTextStyles.title.copyWith(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Divider(color: AppColors.tColor1),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Build", style: AppTextStyles.body),
                  Text(
                    "2025.1.0",
                    style: AppTextStyles.title.copyWith(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Divider(color: AppColors.tColor1),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Platform", style: AppTextStyles.body),
                  Text(
                    "ios/android",
                    style: AppTextStyles.title.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
