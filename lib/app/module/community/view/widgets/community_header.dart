import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../global_widgets/profile_drawer.dart';
import '../../../home/view/widgets/profile_sheet.dart';

class CommunityHeader extends StatelessWidget {
  const CommunityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              AppDialogs.openLeftSideSheet(
                context: context,
                child: const ProfileSheet(),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
              child: Image.asset(AppImages.drawer3),
            ),
          ),

          // ),
          Container(
            height: 55,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 1,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
            child: Image.asset(AppImages.dotsY, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
