import 'package:get/get.dart';
import 'package:statifi/app/module/subscription_plans/controller/subscription_plan_controller.dart';

class SubscriptionPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SubscriptionPlanController());
  }
}
