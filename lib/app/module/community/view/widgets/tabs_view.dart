import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/community/view/screens/trade_idea.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/constants/app_texts.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import '../../controller/community_controller.dart';
import '../screens/all_post_view.dart';
import '../screens/communities_view.dart';
import '../screens/community_post.dart';
import '../screens/traders_view.dart';

class CommunityTabsView extends GetView<CommunityController> {
  CommunityTabsView({super.key}) {
    controller.selectedIndex.value = 0;
  }

  Widget _noDataFound() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.msgIcon, width: 70, height: 70),
          const SizedBox(height: 15),
          Text(
            AppText.noPostsFound,
            style: AppTextStyles.title.copyWith(fontSize: 23),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            AppText.beFirstToShare,
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- TAB HEADER ---
        SizedBox(
          height: 45,
          child: Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(controller.tabs.length, (index) {
                  final isSelected = controller.selectedIndex.value == index;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () => controller.changeTab(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF36CFE6)
                              : const Color(0xFF293645).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.blueAccent.withOpacity(0.4),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : [],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          controller.tabs[index],
                          style: AppTextStyles.body.copyWith(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w500,
                            color: isSelected
                                ? Colors.black
                                : Colors.white.withOpacity(0.4),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // --- TAB CONTENT AREA ---
        Expanded(
          child: Obx(() {
            switch (controller.selectedIndex.value) {
              case 0: // All Posts
                return controller.allPosts.isEmpty
                    ? _noDataFound()
                    : AllPostsView();
              case 1: // Communities
                return controller.communities.isEmpty
                    ? _noDataFound()
                    : const CommunitiesView();
              case 2: // Traders
                return controller.traders.isEmpty
                    ? _noDataFound()
                    : const TradersView();
              case 3:
                return controller.tradeIdeas.isEmpty
                    ? _noDataFound()
                    : const TradersView();

              default:
                return _noDataFound();
            }
          }),
        ),
      ],
    );
  }
}
