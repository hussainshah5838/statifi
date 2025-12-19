import 'package:get/get.dart';
import 'package:statifi/app/module/journal/controller/journal_controller.dart';

class JournalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(JournalController());
  }
}
