import 'package:get/get.dart';
import 'package:statifi/app/module/platforms/controller/platform_controller.dart';

class PlatformBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PlatformController());
  }
}
