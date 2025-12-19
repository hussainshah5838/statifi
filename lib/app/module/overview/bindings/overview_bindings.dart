import 'package:get/get.dart';
import 'package:statifi/app/module/overview/controller/overview_controller.dart';

class OverviewBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OverviewController());
  }
}
