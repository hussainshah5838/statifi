import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/notifications/controller/notifications_controller.dart';
import 'package:statifi/app/module/notifications/view/widgets/header_tile.dart';
import 'package:statifi/app/module/notifications/view/widgets/notifications_card.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/app_background.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Column(
            children: [
              HeaderTile(onClear: controller.clearAll, controller: controller),

              const SizedBox(height: 20),

              Expanded(
                child: Obx(() {
                  if (controller.notifications.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.bell, width: 75, height: 75),
                          SizedBox(height: 20),
                          Text(
                            "No Notifications Yet!",
                            style: AppTextStyles.title.copyWith(fontSize: 22),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "No Notifications to be shown yet.",
                            style: AppTextStyles.body.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  }

                  return CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final item = controller.notifications[index];
                          return NotificationTile(
                            title: item["title"] ?? "",
                            subtitle: item["subtitle"] ?? "",
                            time: item["time"] ?? "",
                          );
                        }, childCount: controller.notifications.length),
                      ),

                      // Section header
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Yesterday',
                            style: AppTextStyles.body.copyWith(
                              color: Colors.white30,
                            ),
                          ),
                        ),
                      ),

                      // Second notification section
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final item = controller.notifications2[index];
                          return NotificationTile(
                            title: item["title"] ?? "",
                            subtitle: item["subtitle"] ?? "",
                            time: item["time"] ?? "",
                          );
                        }, childCount: controller.notifications2.length),
                      ),

                      // Another section header
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Older',
                            style: AppTextStyles.body.copyWith(
                              color: Colors.white30,
                            ),
                          ),
                        ),
                      ),

                      // Third notification section (example, using notifications2 again)
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final item = controller.notifications2[index];
                          return NotificationTile(
                            title: item["title"] ?? "",
                            subtitle: item["subtitle"] ?? "",
                            time: item["time"] ?? "",
                          );
                        }, childCount: controller.notifications2.length),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
