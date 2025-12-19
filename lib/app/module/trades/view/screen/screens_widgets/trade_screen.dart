import 'package:flutter/material.dart';
import 'package:statifi/app/module/trades/view/screen/screens_widgets/empty_widget.dart';

import '../../../../../../data/models/trade_model.dart';
import '../../../../../../global_widgets/app_textstyle.dart';

class TradeScreen extends StatelessWidget {
  final String type;
  final List<Trade> trades;

  const TradeScreen({super.key, required this.type, required this.trades});

  @override
  Widget build(BuildContext context) {
    if (trades.isEmpty) {
      return const EmptyTradeCard();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: trades.length,
      itemBuilder: (context, index) {
        final trade = trades[index];

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white10, width: 0.05),
                      color: trade.tradeType == "BUY"
                          ? const Color(0xFF49DD7F).withOpacity(0.08)
                          : trade.tradeType == "SELL"
                          ? Colors.red.withOpacity(0.2)
                          : Colors.red.withOpacity(0.2),
                    ),
                    child: Text(
                      trade.tradeType,
                      style: AppTextStyles.title.copyWith(
                        color: trade.tradeType == "BUY"
                            ? const Color(0xFF49DD7F)
                            : trade.tradeType == "SELL"
                            ? Colors.red
                            : Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${trade.title}\n",
                          style: AppTextStyles.title.copyWith(fontSize: 16),
                        ),
                        TextSpan(
                          text: "${trade.setTrade}",
                          style: AppTextStyles.body.copyWith(fontSize: 12),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                          text: "${trade.sellTrade}",
                          style: AppTextStyles.body.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),

                  Spacer(),

                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${trade.profitLoss}\n",
                          style: AppTextStyles.title.copyWith(
                            fontSize: 16,
                            color: trade.type == "Win"
                                ? const Color(0xFF49DD7F)
                                : trade.type == "Loss"
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: "${trade.dateTime}",
                          style: AppTextStyles.body.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Divider(color: Colors.white10, thickness: 0.5, height: 0),
            const SizedBox(height: 5),
          ],
        );
      },
    );
  }
}
