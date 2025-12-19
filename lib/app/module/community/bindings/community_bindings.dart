import 'package:get/get.dart';
import 'package:statifi/app/module/community/controller/community_controller.dart';

class CommunityBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CommunityController());
  }
}
