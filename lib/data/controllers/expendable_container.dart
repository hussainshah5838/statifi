import 'package:get/get.dart';

class ExpendableContainerController extends GetxController {
  RxBool isExpanded = false.obs;

  void toggle() {
    isExpanded.value = !isExpanded.value;
  }
}
