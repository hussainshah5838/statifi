import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/charts/controller/candle_sticks_controller.dart';
import 'package:statifi/app/module/charts/controller/charts_controller.dart';
import 'package:statifi/app/module/charts/view/widgets/candle_stick_class.dart';
import 'package:statifi/app/module/charts/view/widgets/sell_buy_header.dart';
import 'package:statifi/app/module/charts/view/widgets/title_header.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/auth_button.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_texts.dart';
import 'package:dotted_line/dotted_line.dart';
import '../../../../global_widgets/app_background.dart';
import '../../../../global_widgets/appbar_header.dart';
import '../../../../global_widgets/profile_drawer.dart';
import '../../home/view/widgets/profile_sheet.dart';

import '../../../../core/constants/app_colors.dart';

import '../../../../global_widgets/app_textstyle.dart';

class ChartsView extends GetView<ChartsController> {
  const ChartsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CandleStickController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          width: context.screenWidth,
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Stack(
            children: [
              //----------------------------------------------------------------
              // BACKGROUND CANDLE CHART LAYER
              //----------------------------------------------------------------
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(top: 90, bottom: 70),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ColoredBox(
                      color: Colors.black.withOpacity(0.15),
                      child: QuotexStyleChart(),
                    ),
                  ),
                ),
              ),

              //----------------------------------------------------------------
              // TOP APP BAR + TITLE
              //----------------------------------------------------------------
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  child: AppbarHeader(
                    title: AppText.charts,
                    backImg: AppImages.drawer3,
                    onBackTap: () {
                      AppDialogs.openLeftSideSheet(
                        context: context,
                        child: const ProfileSheet(),
                      );
                    },
                  ),
                ),
              ),

              //----------------------------------------------------------------
              // TRADING PAIR + PRICES + BUY / SELL BUTTONS
              //----------------------------------------------------------------
              Positioned(top: 70, left: 18, right: 18, child: TitleHeader()),

              //----------------------------------------------------------------
              // BUY / SELL PRICES ROW (like screenshot)
              //----------------------------------------------------------------
              Positioned(top: 130, left: 18, right: 18, child: SellBuyHeader()),

              //----------------------------------------------------------------
              // RIGHT SIDE LABELS (BB Upper / Basis / Lower)
              //----------------------------------------------------------------
              Positioned(
                right: 10,
                top: context.screeHeight * 0.28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _legendBox(
                      "4,102.741\n55: 51",
                      AppColors.textGreen.withOpacity(0.3),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      children: [
                        _legendBox("BB: Upper", Colors.red),
                        const SizedBox(width: 5),
                        _legendBox("4,181.915", Colors.red),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _legendBox("BB: Basis", Colors.blue),
                        const SizedBox(width: 5),
                        _legendBox("4,141.915", Colors.blue),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        _legendBox(
                          "BB: Lower",
                          AppColors.textGreen.withOpacity(0.3),
                        ),
                        const SizedBox(width: 5),
                        _legendBox(
                          "4,102.915",
                          AppColors.textGreen.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //----------------------------------------------------------------
              // LEFT TOOLS VERTICAL BAR
              //----------------------------------------------------------------
              Positioned(
                left: 15,
                top: context.screeHeight * 0.25,
                child: _leftToolsBar(),
              ),

              //----------------------------------------------------------------
              // Stoch NAV BAR
              //----------------------------------------------------------------
              Positioned(
                bottom: 150,
                left: 10,
                right: 0,
                child: Text(
                  "Stoch RSI 3 3 14 14 close",
                  style: AppTextStyles.body,
                ),
              ),
              Positioned(
                bottom: 75,
                left: 0,
                right: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _stochWidget()),
                    const SizedBox(width: 10),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0, right: 18),
                      child: Text("80.00", style: AppTextStyles.body),
                    ),
                  ],
                ),
              ),

              //----------------------------------------------------------------
              // BOTTOM NAV BAR
              //----------------------------------------------------------------
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: _bottomNavigationBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //----------------------------------------------------------------
  // COMPONENTS
  //----------------------------------------------------------------

  Widget _legendBox(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyles.body.copyWith(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _leftToolsBar() {
    return Container(
      width: 50,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(height: 6),
          Image.asset(AppImages.l1, width: 16),
          SizedBox(height: 18),
          Image.asset(AppImages.l2, width: 24),
          SizedBox(height: 18),
          Image.asset(AppImages.l3, width: 24),
          SizedBox(height: 18),
          Image.asset(AppImages.l4, width: 24),
          SizedBox(height: 18),
          Image.asset(AppImages.l5, width: 24),
          SizedBox(height: 18),
          Image.asset(AppImages.l6, width: 24),
          SizedBox(height: 18),
          Image.asset(AppImages.l7, width: 24),
          SizedBox(height: 18),
          Image.asset(AppImages.l8, width: 24),
          SizedBox(height: 18),
          Image.asset(AppImages.l9, width: 24),
          SizedBox(height: 18),
          Image.asset(AppImages.l10, width: 24),
          SizedBox(height: 18),
          Image.asset(AppImages.l11, width: 24),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.tColor1, width: 1),
          bottom: BorderSide(color: AppColors.tColor1, width: 1),
        ),
      ),

      child: Row(
        children: [
          Text("XAUUSD", style: TextStyle(color: Colors.white, fontSize: 14)),
          const SizedBox(width: 18),
          Text("1H", style: TextStyle(color: Colors.white70, fontSize: 14)),
          const Spacer(),
          Image.asset(AppImages.b1, width: 24),
          const SizedBox(width: 18),
          Image.asset(AppImages.b2, width: 24),
          const SizedBox(width: 18),
          Image.asset(AppImages.b3, width: 24),
          const SizedBox(width: 18),
          Image.asset(AppImages.b4, width: 24),
          const SizedBox(width: 18),
          Image.asset(AppImages.b5, width: 24),
        ],
      ),
    );
  }

  Widget _stochWidget() {
    return Container(
      color: Color(0xFF2B61FE).withOpacity(0.03),
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DottedLine(
            dashLength: 8.0,
            dashGapLength: 4.0,
            lineThickness: 0.7,
            dashColor: Colors.white54,
          ),
          Container(
            alignment: Alignment.center,
            height: 47,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Center(
              child: Text(
                '',
                textAlign: TextAlign.center,
                style: AppTextStyles.title.copyWith(
                  fontSize: 14,
                  color: AppColors.textAmber.withOpacity(0.9),
                ),
              ),
            ),
          ),
          DottedLine(
            dashLength: 8.0,
            dashGapLength: 4.0,
            lineThickness: 0.7,
            dashColor: Colors.white54,
          ),
        ],
      ),
    );
  }
}
