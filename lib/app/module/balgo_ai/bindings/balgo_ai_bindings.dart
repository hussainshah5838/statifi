import 'package:get/get.dart';
import 'package:statifi/app/module/balgo_ai/controller/balgo_ai_controller.dart';

class BalgoAiBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BalgoAiController());
  }
}
