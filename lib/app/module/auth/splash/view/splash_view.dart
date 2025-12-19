import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/core/constants/app_texts.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(gradient: AppBackground.splashGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Center(
              child: Image.asset(
                AppImages.appLogo,
                width: AppSizes.lWidth,
                height: AppSizes.lWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(AppText.poweredBy, style: AppTextStyles.heading2),
            ),
          ],
        ),
      ),
    );
  }
}
