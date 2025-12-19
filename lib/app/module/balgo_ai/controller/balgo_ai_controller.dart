import 'package:get/get.dart';

class BalgoAiController extends GetxController {
  RxBool isBalgoOn = false.obs;

  void toggleBalgo(bool value) {
    isBalgoOn.value = value;
  }
}
