import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/platforms/controller/platform_controller.dart';
import 'package:statifi/app/module/platforms/view/screen/platform_tab_screen.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';
import 'package:statifi/global_widgets/common_header.dart';

import '../../../../global_widgets/app_background.dart';
import '../../../../global_widgets/profile_drawer.dart';
import '../../home/view/widgets/profile_sheet.dart';

class PlatformsView extends GetView<PlatformController> {
  const PlatformsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Column(
            children: [
              AppbarHeader(
                backImg: AppImages.drawer3,
                onBackTap: () {
                  AppDialogs.openLeftSideSheet(
                    context: context,
                    child: const ProfileSheet(),
                  );
                },
              ),

              const SizedBox(height: 25),

              CommonHeader(
                title: "Trading Platform",
                subtitle:
                    "Connect MT4, MT5, Tradovate, Ninjatraders and many more",
              ),

              const SizedBox(height: 10),

              Expanded(child: PlatformTabScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
