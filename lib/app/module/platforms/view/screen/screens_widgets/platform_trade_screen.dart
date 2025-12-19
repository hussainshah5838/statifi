import 'package:flutter/material.dart';
import 'package:statifi/app/module/platforms/view/screen/screens_widgets/platform_empty_widget.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/data/models/platforms_model.dart';

import '../../../../../../global_widgets/app_textstyle.dart';

class PlatformTradeScreen extends StatelessWidget {
  final List<PlatformsModel> trades;
  final String tabName;

  const PlatformTradeScreen({
    super.key,
    required this.trades,
    required this.tabName,
  });

  @override
  Widget build(BuildContext context) {
    /// If list is empty → show empty widget
    if (trades.isEmpty) {
      return PlatformEmptyWidget(tabName: tabName);
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: trades.length,
      itemBuilder: (context, index) {
        final trade = trades[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF29452A).withOpacity(0.2),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(trade.img, width: 40),
                      const SizedBox(width: 10),

                      /// Title + platform
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${trade.title}\n",
                              style: AppTextStyles.title.copyWith(fontSize: 16),
                            ),
                            TextSpan(
                              text: "Platform: ${trade.platform}",
                              style: AppTextStyles.body.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      /// Actions
                      Image.asset(
                        AppImages.delete,
                        width: 32,
                        height: 32,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 3),
                      Image.asset(
                        AppImages.edit,
                        width: 32,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                const Divider(color: Colors.white10, thickness: 0.5, height: 0),
                const SizedBox(height: 15),

                /// Broker + Server row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Broker\n", style: AppTextStyles.body),
                          const WidgetSpan(child: SizedBox(height: 22)),
                          TextSpan(
                            text: trade.broker,
                            style: AppTextStyles.title.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Server\n", style: AppTextStyles.body),
                          const WidgetSpan(child: SizedBox(height: 22)),
                          TextSpan(
                            text: trade.server,
                            style: AppTextStyles.title.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
