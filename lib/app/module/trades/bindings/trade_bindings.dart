import 'package:get/get.dart';
import 'package:statifi/app/module/trades/controller/trade_controller.dart';

class TradeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TradeController());
  }
}
