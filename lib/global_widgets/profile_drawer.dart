import 'package:flutter/material.dart';
import 'package:statifi/app/module/balgo_ai/view/widgets/ai_generation_sheet.dart';
import 'package:statifi/app/module/balgo_ai/view/widgets/report_generation_bottom_sheet.dart';
import 'package:statifi/app/module/charts/view/widgets/trade_sheet.dart';
import 'package:statifi/app/module/journal/view/widgets/analyze_profile.dart';
import 'package:statifi/app/module/platforms/view/screen/screen_widgets/mt4_account_sheet.dart';
import 'package:statifi/app/module/platforms/view/screen/screen_widgets/ninja_account_sheet.dart';
import 'package:statifi/app/module/platforms/view/screen/screen_widgets/tradovate_account_sheet.dart';

import '../app/module/journal/view/widgets/add_strategy_sheet.dart';
import '../app/module/trades/view/widgets/add_trade_bottom_sheet.dart';

class AppDialogs {
  static void openLeftSideSheet({
    required BuildContext context,
    required Widget child,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      barrierLabel: "SideSheet",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.centerLeft,
          child: SafeArea(child: child),
        );
      },
      transitionBuilder: (_, anim, __, dialogChild) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(anim),
          child: dialogChild,
        );
      },
    );
  }

  static void openAddTradeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const AddTradeBottomSheet(),
    );
  }

  static void openNinjaAccountSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const NinjaAccountSheet(),
    );
  }

  static void openTradovateAccountSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const TradovateAccountSheet(),
    );
  }

  static void openMT4AccountSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const Mt4AccountSheet(),
    );
  }

  static void reportGeneration({
    required BuildContext context,
    required String title,
    required String timeFrameText,
    required String timeText,
    required String reportInclude,
    required List<String> reportList,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ReportGenerationBottomSheet(
        title: title,
        timeFrameText: timeFrameText,
        timeText: timeText,
        reportInclude: reportInclude,
        reportList: reportList,
      ),
    );
  }

  static void strategyNoteSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AddStrategySheet(
          title: 'Add Strategy Notes',
          subtitle:
              'Please enter the correct information to add strategy notes.',
        ),
      ),
    );
  }

  static void analyzeProfileSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const AnalyzeProfile(),
    );
  }

  static void tradeSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const TradeSheet(),
    );
  }
}
