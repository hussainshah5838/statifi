import 'package:flutter/material.dart';
import 'package:statifi/app/module/user_profile/view/screens/screens_widgets/trading_preferences_container.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';

import '../../../../../global_widgets/app_background.dart';

class TradingPreferences extends StatelessWidget {
  const TradingPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          width: context.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarHeader(title: "Trading Preferences"),

                const SizedBox(height: 15),

                TradingPreferencesContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
