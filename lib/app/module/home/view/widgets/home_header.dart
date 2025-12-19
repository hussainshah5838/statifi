import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/home/view/widgets/profile_sheet.dart';
import 'package:statifi/app/module/notifications/controller/notifications_controller.dart';
import 'package:statifi/app/module/notifications/view/notifications_view.dart';
import 'package:statifi/app/module/overview/view/overview.dart';

import '../../../../../global_widgets/profile_drawer.dart';

class HomeHeader extends StatelessWidget {
  final String leftImage;
  final List<String> rightImages;

  const HomeHeader({
    super.key,
    required this.leftImage,
    required this.rightImages,
  }) : assert(rightImages.length == 3, "Provide exactly 3 right images");

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationsController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            AppDialogs.openLeftSideSheet(
              context: context,
              child: const ProfileSheet(),
            );
          },
          child: _circleImage(leftImage),
        ),

        Row(
          children: List.generate(3, (index) {
            final image = rightImages[index];
            final padding = EdgeInsets.only(left: index == 0 ? 0 : 14);

            if (index == 1) {
              return Padding(
                padding: padding,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const NotificationsView());
                  },
                  child: _circleImage(image),
                ),
              );
            }
            if (index == 2) {
              return Padding(
                padding: padding,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => Overview());
                  },
                  child: _circleImage(image),
                ),
              );
            }

            return Padding(padding: padding, child: _circleImage(image));
          }),
        ),
      ],
    );
  }

  Widget _circleImage(String path) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white10, width: 0.1),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }
}
