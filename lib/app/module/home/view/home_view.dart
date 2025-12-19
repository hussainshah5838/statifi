import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/home/controller/home_controller.dart';
import 'package:statifi/app/module/home/view/widgets/bar_chart_card.dart';
import 'package:statifi/app/module/home/view/widgets/bar_chart_total.dart';
import 'package:statifi/app/module/home/view/widgets/chart_card_bottom.dart';
import 'package:statifi/app/module/home/view/widgets/chart_card_metrics.dart';
import 'package:statifi/app/module/home/view/widgets/home_header.dart';
import 'package:statifi/app/module/home/view/widgets/line_chart_card.dart';
import 'package:statifi/app/module/home/view/widgets/platform_connect_card.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/constants/app_texts.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/title_section.dart';

import '../../../../global_widgets/app_background.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),

          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                HomeHeader(
                  leftImage: AppImages.drawer,
                  rightImages: [
                    AppImages.search,
                    AppImages.notification,
                    AppImages.settings,
                  ],
                ),

                const SizedBox(height: 20),
                TitleSection(
                  title: AppText.welcomeKevin,
                  subtitle: AppText.yourTradingBlueprint,
                ),

                const SizedBox(height: 20),

                LineChartCard(),
                SizedBox(height: 16),

                BarChartTotal(),
                SizedBox(height: 16),

                ChartCardBottom(),
                SizedBox(height: 16),

                BarChartCard(),
                SizedBox(height: 16),

                ChartCardMetrics(),
                SizedBox(height: 16),

                PlatformConnectCard(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
