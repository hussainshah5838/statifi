import 'package:flutter/material.dart';
import 'package:statifi/app/module/trades/view/screen/screens_widgets/trade_screen.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

import '../../../../../data/models/trade_model.dart';

class TradeTabs extends StatefulWidget {
  const TradeTabs({super.key});

  @override
  State<TradeTabs> createState() => _TradeTabsState();
}

class _TradeTabsState extends State<TradeTabs> {
  int selectedIndex = 0;
  final List<String> tabs = ["All", "Wins", "Loss", "Pending"];

  // ------------------ Sample Data ------------------
  final List<Trade> wins = [
    Trade(
      title: "XAUUSD.p",
      type: "Win",
      tradeType: 'BUY',
      setTrade: '3933.42',
      sellTrade: '3935.16',
      profitLoss: '+ 175.00',
      dateTime: "Oct 23, 2025 | 12:00 PM",
    ),
    Trade(
      title: "XAUUSD.p",
      type: "Win",
      tradeType: 'BUY',
      setTrade: '3933.42',
      sellTrade: '3935.16',
      profitLoss: '+ 175.00',
      dateTime: "Oct 23, 2025 | 12:00 PM",
    ),
    Trade(
      title: "XAUUSD.p",
      type: "Win",
      tradeType: 'BUY',
      setTrade: '3933.42',
      sellTrade: '3935.16',
      profitLoss: '+ 175.00',
      dateTime: "Oct 23, 2025 | 12:00 PM",
    ),
    Trade(
      title: "XAUUSD.p",
      type: "Win",
      tradeType: 'BUY',
      setTrade: '3933.42',
      sellTrade: '3935.16',
      profitLoss: '+ 175.00',
      dateTime: "Oct 23, 2025 | 12:00 PM",
    ),
  ];

  final List<Trade> losses = [
    Trade(
      title: "XAUUSD.p",
      type: "Loss",
      tradeType: 'BUY',
      setTrade: '3933.42',
      sellTrade: '3930.16',
      profitLoss: '- 175.00',
      dateTime: "Oct 23, 2025 | 12:00 PM",
    ),
    Trade(
      title: "XAUUSD.p",
      type: "Loss",
      tradeType: 'SELL',
      setTrade: '3933.42',
      sellTrade: '3930.16',
      profitLoss: '- 175.00',
      dateTime: "Oct 23, 2025 | 12:00 PM",
    ),
    Trade(
      title: "XAUUSD.p",
      type: "Loss",
      tradeType: 'BUY',
      setTrade: '3933.42',
      sellTrade: '3930.16',
      profitLoss: '- 175.00',
      dateTime: "Oct 23, 2025 | 12:00 PM",
    ),
    Trade(
      title: "XAUUSD.p",
      type: "Loss",
      tradeType: 'SELL',
      setTrade: '3933.42',
      sellTrade: '3930.16',
      profitLoss: '- 175.00',
      dateTime: "Oct 23, 2025 | 12:00 PM",
    ),
  ];

  final List<Trade> pendings = [
    Trade(
      title: "XAUUSD.p",
      type: "Win",
      tradeType: 'BUY',
      setTrade: '3933.42',
      sellTrade: '3935.16',
      profitLoss: '+ 175.00',
      dateTime: "Oct 23, 2025 | 12:00 PM",
    ),
    Trade(
      title: "XAUUSD.p",
      type: "Loss",
      tradeType: 'SELL',
      setTrade: '3933.42',
      sellTrade: '3930.16',
      profitLoss: '- 175.00',
      dateTime: "Oct 23, 2025 | 12:00 PM",
    ),
  ];

  List<Trade> get allTrades => [...wins, ...losses, ...pendings];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTabRow(),
        const SizedBox(height: 20),

        Container(
          height: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.tradovate, width: 24),
              const SizedBox(width: 7),
              Text(
                'Tradovate',
                style: AppTextStyles.title.copyWith(fontSize: 16),
              ),

              const SizedBox(width: 7),

              Icon(Icons.keyboard_arrow_down, size: 25, color: Colors.white),
            ],
          ),
        ),

        const SizedBox(height: 15),

        Expanded(child: _buildTabContent()),
      ],
    );
  }

  Widget _buildTabRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(tabs.length, (index) {
        final bool isSelected = index == selectedIndex;
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.btnColor1 : AppColors.tColor1,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                tabs[index],
                style: AppTextStyles.body.copyWith(
                  color: isSelected ? Colors.black : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTabContent() {
    switch (selectedIndex) {
      case 0:
        return TradeScreen(trades: allTrades, type: "All");
      case 1:
        return TradeScreen(trades: wins, type: "Wins");
      case 2:
        return TradeScreen(trades: losses, type: "Loss");
      case 3:
        // return TradeScreen(trades: pendings, type: "Pending");
        return TradeScreen(trades: [], type: "Pending");

      default:
        return TradeScreen(trades: allTrades, type: "All");
    }
  }
}
