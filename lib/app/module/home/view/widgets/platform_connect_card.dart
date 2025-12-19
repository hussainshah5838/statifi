import 'package:dotted_border/dotted_border.dart' hide DottedBorder;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_texts.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

import '../../../../../core/extentions/custom_painters.dart';
import 'mini_widgets/card_tile.dart';

class PlatformConnectCard extends StatelessWidget {
  const PlatformConnectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF29364580),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppText.connectTradingPlatforms,
            style: AppTextStyles.title.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            AppText.syncAccounts,
            style: AppTextStyles.title.copyWith(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 10),
          CardTile(name: AppText.metaTrader4, nText: 'MT4', isConnected: true),

          const SizedBox(height: 10),
          CardTile(name: AppText.metaTrader5, nText: 'MT5', isConnected: true),

          const SizedBox(height: 10),
          CardTile(name: AppText.tradovate, nText: 'TV', isConnected: false),

          const SizedBox(height: 10),
          CardTile(name: AppText.ninjaTrader, nText: 'NT', isConnected: false),

          const SizedBox(height: 15),

          Container(
            alignment: Alignment.center,
            height: 47,
            padding: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: AppColors.textAmber.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: DottedBorder(
                color: AppColors.textAmber,
                strokeWidth: 1,
                dashWidth: 8.0,
                dashGap: 4.0,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1.5),
                child: Text(
                  AppText.manageConnections,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title.copyWith(
                    fontSize: 14,
                    color: AppColors.textAmber,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
