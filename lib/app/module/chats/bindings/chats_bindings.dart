import 'package:get/get.dart';
import 'package:statifi/app/module/chats/controller/chats_controller.dart';

class ChatsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatsController());
  }
}
