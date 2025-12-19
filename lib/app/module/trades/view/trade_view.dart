import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/trades/controller/trade_controller.dart';
import 'package:statifi/app/module/trades/view/screen/trade_tab_screen.dart';
import 'package:statifi/app/module/trades/view/widgets/add_trade_bottom_sheet.dart';
import 'package:statifi/app/module/trades/view/widgets/trade_notifications_container.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/appbar_header.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../global_widgets/app_background.dart';
import '../../../../global_widgets/profile_drawer.dart';
import '../../home/view/widgets/profile_sheet.dart';

class TradeView extends GetView<TradeController> {
  const TradeView({super.key});

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
                title: AppText.trades,
                rightRawImage: AppImages.plusBold,
                backImg: AppImages.drawer3,
                onBackTap: () {
                  AppDialogs.openLeftSideSheet(
                    context: context,
                    child: const ProfileSheet(),
                  );
                },
                onImageTap: () {
                  AppDialogs.openAddTradeSheet(context);
                },
              ),

              const SizedBox(height: 25),

              TradeNotificationsContainer(),

              const SizedBox(height: 20),

              Expanded(child: TradeTabs()),
            ],
          ),
        ),
      ),
    );
  }
}
