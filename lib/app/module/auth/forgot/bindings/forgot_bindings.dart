import 'package:get/get.dart';
import 'package:statifi/app/module/auth/forgot/controllers/forgot_controller.dart';

class ForgotBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotController());
  }
}
