import 'package:get/get.dart';
import 'package:statifi/app/module/user_profile/controller/user_profile_controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserProfileController());
  }
}
