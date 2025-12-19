import 'package:get/get.dart';

import '../../../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateNext();
  }

  void _navigateNext() async {
    print("Splash starting...");
    await Future.delayed(const Duration(seconds: 3));
    print("Navigating to login...");
    Get.offAllNamed(AppRoutes.login);
  }
}
