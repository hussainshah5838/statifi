import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/user_profile/controller/user_profile_controller.dart';
import 'package:statifi/app/module/user_profile/view/screens/edit_profile.dart';
import 'package:statifi/app/module/user_profile/view/widgets/app_information.dart';
import 'package:statifi/app/module/user_profile/view/widgets/custom_row_widget.dart';
import 'package:statifi/app/module/user_profile/view/widgets/legal_security.dart';
import 'package:statifi/app/module/user_profile/view/widgets/member_card.dart';
import 'package:statifi/app/module/user_profile/view/widgets/quick_actions.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';

import '../../../../global_widgets/app_background.dart';
import '../../../../global_widgets/profile_drawer.dart';
import '../../home/view/widgets/profile_sheet.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarHeader(
                  title: "User Profile",
                  backImg: AppImages.drawer3,
                  onBackTap: () {
                    AppDialogs.openLeftSideSheet(
                      context: context,
                      child: const ProfileSheet(),
                    );
                  },
                ),

                const SizedBox(height: 20),

                CircularImageRow(
                  imagePath: AppImages.mocProfile,
                  pencilIcon: AppImages.premium1,
                  title: "Kevin Backer",
                  subtitle: 'kevinbacker234@gmail.com',
                  onTap: () {
                    Get.to(EditProfile());
                  },
                ),

                const SizedBox(height: 15),

                MemberCard(),

                const SizedBox(height: 20),

                QuickActions(),

                const SizedBox(height: 20),

                LegalSecurity(),

                const SizedBox(height: 20),

                AppInformation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
