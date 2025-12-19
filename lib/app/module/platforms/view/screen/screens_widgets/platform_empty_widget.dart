import 'package:flutter/material.dart';
import 'package:statifi/global_widgets/auth_button.dart';

import '../../../../../../core/constants/app_images.dart';
import '../../../../../../global_widgets/app_textstyle.dart';
import '../../../../../../global_widgets/profile_drawer.dart';

class PlatformEmptyWidget extends StatelessWidget {
  final String tabName;

  const PlatformEmptyWidget({super.key, required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.wallet, width: 72),
        const SizedBox(height: 20),

        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "No Accounts Found\n",
                style: AppTextStyles.title.copyWith(fontSize: 22),
              ),
              WidgetSpan(child: SizedBox(height: 25)),
              TextSpan(
                text: "Tap to add your favourite trading platforms and enjoy.",
                style: AppTextStyles.body.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        SizedBox(
          width: 160,
          child: AuthButton(
            text: "+Add account",
            onTap: () {
              if (tabName == "MT4/MT5") {
                AppDialogs.openMT4AccountSheet(context);
              } else if (tabName == "Tradovate") {
                AppDialogs.openTradovateAccountSheet(context);
              } else if (tabName == "NinjaTrader") {
                AppDialogs.openNinjaAccountSheet(context);
              }
            },
          ),
        ),
      ],
    );
  }
}
