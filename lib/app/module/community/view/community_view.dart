import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/community/controller/community_controller.dart';
import 'package:statifi/app/module/community/view/widgets/community_header.dart';
import 'package:statifi/app/module/community/view/widgets/tabs_view.dart';
import 'package:statifi/core/constants/app_texts.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';

import '../../../../global_widgets/app_background.dart';
import '../../../../global_widgets/app_textstyle.dart';

class CommunityView extends StatelessWidget {
  final controller = Get.put(CommunityController());

  CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommunityHeader(),
                const SizedBox(height: 20),
                Text(
                  AppText.community,
                  style: AppTextStyles.title.copyWith(fontSize: 24),
                ),

                const SizedBox(height: 5),

                Text(AppText.exploreTraders, style: AppTextStyles.body),

                const SizedBox(height: 20),

                Expanded(child: CommunityTabsView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
