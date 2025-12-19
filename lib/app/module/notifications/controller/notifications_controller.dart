import 'package:get/get.dart';

class NotificationsController extends GetxController {
  var notifications = <Map<String, String>>[
    {
      "title": "Account Created!",
      "subtitle": "Your account has been successfully created.",
      "time": "12 mins ago",
    },
    {
      "title": "Trade Added",
      "subtitle": "You have added a new trade using forex account.",
      "time": "30 mins ago",
    },
    {
      "title": "Trade Added",
      "subtitle": "You have added a new trade using forex account.",
      "time": "30 mins ago",
    },
  ].obs;
  var notifications2 = <Map<String, String>>[
    {
      "title": "Trade Added",
      "subtitle": "You have added a new trade using forex account.",
      "time": "30 mins ago",
    },
    {
      "title": "Trade Added",
      "subtitle": "You have added a new trade using forex account.",
      "time": "30 mins ago",
    },
  ].obs;

  void clearAll() {
    notifications.clear();
  }
}
