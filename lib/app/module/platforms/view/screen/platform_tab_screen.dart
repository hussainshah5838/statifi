import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/platforms/view/screen/screens_widgets/platform_trade_screen.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/data/models/platforms_model.dart';
import '../../controller/platform_controller.dart';

class PlatformTabScreen extends StatelessWidget {
  final PlatformController controller = Get.put(PlatformController());

  final List<String> tabs = ["MT4/MT5", "Tradovate", "NinjaTrader"];

  final List<PlatformsModel> mt4 = [
    PlatformsModel(
      title: "MT4",
      platform: 'Forex',
      broker: "Broker name here",
      server: "Server name here",
      img: AppImages.mt4,
    ),
    PlatformsModel(
      title: "Tradovate",
      platform: 'Forex',
      broker: "Broker name here",
      server: "Server name here",
      img: AppImages.tradovate,
    ),
    PlatformsModel(
      title: "Trade Station",
      platform: 'Forex',
      broker: "Broker name here",
      server: "Server name here",
      img: AppImages.tradeStation,
    ),
    PlatformsModel(
      title: "Ninja Trader",
      platform: 'Forex',
      broker: "Broker name here",
      server: "Server name here",
      img: AppImages.ninjaTrader,
    ),
  ];

  final List<PlatformsModel> tradovate = [
    PlatformsModel(
      title: "Tradovate",
      platform: 'Forex',
      broker: "Broker name here",
      server: "Server name here",
      img: AppImages.tradovate,
    ),
  ];

  final List<PlatformsModel> ninjaTrader = [];

  PlatformTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => _buildTabRow()), // reactive
        const SizedBox(height: 20),
        Expanded(child: Obx(() => _buildTabContent())),
      ],
    );
  }

  Widget _buildTabRow() {
    return Row(
      children: List.generate(tabs.length, (index) {
        final isSelected = controller.selectedIndex.value == index;
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () => controller.selectedIndex.value = index,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green : Colors.white10,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTabContent() {
    switch (controller.selectedIndex.value) {
      case 0:
        return PlatformTradeScreen(trades: mt4, tabName: "MT4/MT5");
      case 1:
        return PlatformTradeScreen(trades: tradovate, tabName: "Tradovate");
      case 2:
        return PlatformTradeScreen(trades: ninjaTrader, tabName: "NinjaTrader");
      default:
        return PlatformTradeScreen(trades: mt4, tabName: "MT4/MT5");
    }
  }
}
