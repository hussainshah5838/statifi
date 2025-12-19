import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_images.dart';
import '../../../../../../global_widgets/app_textstyle.dart';

class EmptyTradeCard extends StatelessWidget {
  const EmptyTradeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.increase, width: 72),
        const SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "No Trades Found\n",
                style: AppTextStyles.title.copyWith(fontSize: 22),
              ),
              WidgetSpan(child: const SizedBox(height: 25)),
              TextSpan(
                text:
                    "No trades found. Only authentic trades from your real connected accounts will be displayed. Connect your Metatrader account or add manual trades to get started.",
                style: AppTextStyles.body.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
