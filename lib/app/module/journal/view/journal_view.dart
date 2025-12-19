import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/journal/controller/journal_controller.dart';
import 'package:statifi/app/module/journal/view/widgets/jounal_section.dart';
import 'package:statifi/app/module/journal/view/widgets/recent_notes.dart';
import 'package:statifi/app/module/journal/view/widgets/recommended_strategies.dart';
import 'package:statifi/app/module/journal/view/widgets/trading_calender.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import '../../../../global_widgets/app_background.dart';
import '../../../../global_widgets/profile_drawer.dart';
import '../../home/view/widgets/profile_sheet.dart';
import '../../../../global_widgets/appbar_header.dart';

class JournalView extends GetView<JournalController> {
  const JournalView({super.key});

  @override
  Widget build(BuildContext context) {
    void _analyzeProfile() {
      AppDialogs.analyzeProfileSheet(context: context);
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppbarHeader(
                  title: 'Journal',
                  backImg: AppImages.drawer3,
                  onBackTap: () {
                    AppDialogs.openLeftSideSheet(
                      context: context,
                      child: const ProfileSheet(),
                    );
                  },
                ),
                const SizedBox(height: 10),

                /// TRADING JOURNAL CARD
                JournalSection(),
                const SizedBox(height: 10),

                /// TRADING CALENDAR UI
                TradingCalendar(),
                const SizedBox(height: 10),

                /// Recent Notes
                RecentNotes(),

                const SizedBox(height: 10),

                /// Recommended Strategies
                Obx(
                  () => RecommendedStrategies(
                    showRecommendations: controller.showRecommendations.value,
                    onAnalyzeProfile: _analyzeProfile,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
