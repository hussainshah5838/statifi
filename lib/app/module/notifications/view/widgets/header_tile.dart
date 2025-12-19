import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

import '../../controller/notifications_controller.dart';

class HeaderTile extends StatelessWidget {
  final NotificationsController controller;
  final VoidCallback onClear;

  const HeaderTile({required this.onClear, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "Notifications",
            style: AppTextStyles.title.copyWith(fontSize: 18),
          ),

          Spacer(),
          Obx(
            () => controller.notifications.isNotEmpty
                ? GestureDetector(
                    onTap: onClear,
                    child: Text(
                      "Clear all",
                      style: AppTextStyles.title.copyWith(
                        color: Color(0xFF36CFE6),
                        fontSize: 18,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
