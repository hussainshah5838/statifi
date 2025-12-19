import 'package:get/get.dart';
import 'package:statifi/app/module/charts/controller/charts_controller.dart';

class ChartsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChartsController());
  }
}
