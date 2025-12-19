import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/app/module/chats/view/chats_view.dart';
import 'package:statifi/app/module/community/view/community_view.dart';
import 'package:statifi/app/module/home/view/home_view.dart';
import 'package:statifi/app/module/overview/view/overview.dart';
import 'package:statifi/app/module/user_profile/view/user_profile_view.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/constants/app_texts.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/routes/app_routes.dart';

import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/custom_bottom_sheet.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.65;

    return Material(
      child: Container(
        width: width,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

        alignment: Alignment.center,
        decoration: BoxDecoration(color: Color(0xFF0C121A)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.offAllNamed(AppRoutes.userProfile),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.mocProfile),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  const SizedBox(width: 10),

                  RichText(
                    text: TextSpan(
                      text: 'Christopher H.\n',
                      style: AppTextStyles.title.copyWith(fontSize: 17),
                      children: [
                        TextSpan(
                          text: 'christop234@gmail.com ',
                          style: AppTextStyles.body.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.white.withOpacity(0.05)),
            const SizedBox(height: 10),

            sheetCard(
              title: AppText.overView,
              iconImage: AppImages.home,
              onTap: () => Get.offAllNamed(AppRoutes.home),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.white.withOpacity(0.05)),
            const SizedBox(height: 10),

            sheetCard(
              title: AppText.trades,
              iconImage: AppImages.statusUp,
              onTap: () => Get.offAllNamed(AppRoutes.trade),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.white.withOpacity(0.05)),
            const SizedBox(height: 10),

            sheetCard(
              title: AppText.journals,
              iconImage: AppImages.book,
              onTap: () => Get.offAllNamed(AppRoutes.journal),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.white.withOpacity(0.05)),
            const SizedBox(height: 10),

            sheetCard(
              title: AppText.balgo,
              iconImage: AppImages.ai,
              onTap: () => Get.offAllNamed(AppRoutes.balgoAi),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.white.withOpacity(0.05)),
            const SizedBox(height: 10),

            sheetCard(
              title: AppText.charts,
              iconImage: AppImages.chart,
              onTap: () => Get.offAllNamed(AppRoutes.charts),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.white.withOpacity(0.05)),
            const SizedBox(height: 10),

            sheetCard(
              title: AppText.community,
              iconImage: AppImages.people,
              onTap: () => Get.offAllNamed(AppRoutes.community),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.white.withOpacity(0.05)),
            const SizedBox(height: 10),

            sheetCard(
              title: AppText.chats,
              iconImage: AppImages.messages,
              onTap: () => Get.offAllNamed(AppRoutes.chats),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.white.withOpacity(0.05)),
            const SizedBox(height: 10),

            sheetCard(
              title: AppText.platforms,
              iconImage: AppImages.share,
              onTap: () => Get.offAllNamed(AppRoutes.platforms),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.white.withOpacity(0.05)),
            const SizedBox(height: 10),

            sheetCard(
              title: AppText.userProfile,
              iconImage: AppImages.profile,
              onTap: () => Get.offAllNamed(AppRoutes.userProfile),
            ),
            Spacer(),
            sheetCard(
              title: AppText.logOut,
              iconImage: AppImages.login,
              onTap: () {
                CustomBottomSheet.show(
                  context: context,
                  imagePath: AppImages.logout2,
                  title: AppText.logOut2,
                  subtitle1: AppText.logOutSubtitle,
                  buttonText: AppText.yesLogout,
                  onButtonTap: () {
                    Get.offAllNamed(AppRoutes.login);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget sheetCard({
    required String title,
    required String iconImage,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(iconImage, width: 20, height: 20),
          const SizedBox(width: 10),
          Text(title, style: AppTextStyles.title.copyWith(fontSize: 16)),
        ],
      ),
    );
  }
}
