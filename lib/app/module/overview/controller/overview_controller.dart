import 'package:get/get.dart';

class OverviewController extends GetxController {
  RxBool isPerformanceEnabled = false.obs;
  RxBool isTotalPLEnabled = false.obs;
  RxBool isWinRateEnabled = false.obs;
  RxBool isRiskValueEnabled = false.obs;
  RxBool isRewardValueEnabled = false.obs;
  RxBool isAvgHoldTimeEnabled = false.obs;
  RxBool isProfitFactorEnabled = false.obs;
  RxBool isBestTradeEnabled = false.obs;
  RxBool isMaxDrawdownEnabled = false.obs;
  RxBool isConnectTradingPlatformsEnabled = false.obs;

  void togglePerformance(bool value) => isPerformanceEnabled.value = value;
  void toggleTotalPL(bool value) => isTotalPLEnabled.value = value;
  void toggleWinRate(bool value) => isWinRateEnabled.value = value;
  void toggleRiskValue(bool value) => isRiskValueEnabled.value = value;
  void toggleRewardValue(bool value) => isRewardValueEnabled.value = value;
  void toggleAvgHoldTime(bool value) => isAvgHoldTimeEnabled.value = value;
  void toggleProfitFactor(bool value) => isProfitFactorEnabled.value = value;
  void toggleBestTrade(bool value) => isBestTradeEnabled.value = value;
  void toggleMaxDrawdown(bool value) => isMaxDrawdownEnabled.value = value;
  void toggleConnectTradingPlatforms(bool value) =>
      isConnectTradingPlatformsEnabled.value = value;
}
