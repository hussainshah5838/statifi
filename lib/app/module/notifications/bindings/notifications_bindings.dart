import 'package:get/get.dart';
import 'package:statifi/app/module/notifications/controller/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationsController());
  }
}
