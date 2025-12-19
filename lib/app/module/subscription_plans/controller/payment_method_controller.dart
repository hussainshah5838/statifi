import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  RxInt selectedMethod = 0.obs;

  void selectMethod(int index) {
    selectedMethod.value = index;
  }
}
