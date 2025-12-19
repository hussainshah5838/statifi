import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/chats/controller/chats_controller.dart';
import 'package:statifi/app/module/chats/view/screens/chat_view_msgs.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/constants/app_texts.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';
import '../../../../global_widgets/app_background.dart';
import '../../../../global_widgets/app_textstyle.dart';
import '../../../../global_widgets/profile_drawer.dart';
import '../../home/view/widgets/profile_sheet.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ["All Charts", "Groups", "Archive"];
    var selectedTab = 0.obs; // track selected tab

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Column(
            children: [
              const SizedBox(height: 20),
              AppbarHeader(
                title: AppText.chats,
                img: AppImages.search2,
                backImg: AppImages.drawer3,
                onBackTap: () {
                  AppDialogs.openLeftSideSheet(
                    context: context,
                    child: const ProfileSheet(),
                  );
                },
              ),
              const SizedBox(height: 20),

              Obx(
                () => Row(
                  children: List.generate(tabs.length, (index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => selectedTab.value = index,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: selectedTab.value == index
                                  ? const Color(0xFF36CFE6)
                                  : const Color(0xFF293645).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              tabs[index],
                              style: AppTextStyles.body.copyWith(
                                color: selectedTab.value == index
                                    ? Colors.black
                                    : Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),

                        if (index != tabs.length - 1) const SizedBox(width: 10),
                      ],
                    );
                  }),
                ),
              ),

              const SizedBox(height: 10),

              // Tab Content
              Expanded(
                child: Obx(() {
                  return _buildTabContent(tabs[selectedTab.value]);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(String title) {
    final dummyList = List.generate(
      10,
      (index) => "$title Message ${index + 1}",
    );

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: dummyList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(ChatViewMsgs());
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(AppImages.mocProfile),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "User $index\n",
                            style: AppTextStyles.title.copyWith(fontSize: 14),
                          ),
                          WidgetSpan(child: const SizedBox(height: 20)),
                          TextSpan(
                            text: dummyList[index],
                            style: AppTextStyles.body.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "12:30 PM",
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Icon(
                        Icons.done_all,
                        size: 16,
                        color: Colors.greenAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            if (index != dummyList.length - 1) const SizedBox(height: 5),

            if (index != dummyList.length - 1)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Colors.white.withOpacity(0.05),
                  height: 1,
                ),
              ),
            if (index != dummyList.length - 1) const SizedBox(height: 5),
          ],
        );
      },
    );
  }
}
