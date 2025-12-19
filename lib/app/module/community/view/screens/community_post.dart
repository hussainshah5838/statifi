import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/community/view/community_view.dart';
import 'package:statifi/app/module/community/view/screens/market_analysis_screen.dart';
import 'package:statifi/app/module/community/view/screens/question_screen.dart';
import 'package:statifi/app/module/community/view/screens/strategy_share_screen.dart';
import 'package:statifi/app/module/community/view/screens/sub_widgets/trade_idea_card.dart';
import 'package:statifi/app/module/community/view/screens/success_story.dart';
import 'package:statifi/app/module/community/view/screens/trade_idea.dart';
import 'package:statifi/app/module/home/view/home_view.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../controller/community_controller.dart';

class CommunityPost extends GetView<CommunityController> {
  const CommunityPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Column(
            children: [
              const SizedBox(height: 30),

              AppbarHeader(title: 'Create community post'),

              const SizedBox(height: 10),

              Expanded(
                child: Obx(() {
                  if (controller.communityPost.isEmpty) return const SizedBox();

                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: GridView.builder(
                      itemCount: controller.communityPost.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.15,
                          ),
                      itemBuilder: (context, index) {
                        final idea = controller.communityPost[index];

                        return TradeIdeaCard(
                          image:
                              idea.image ?? 'https://placekitten.com/100/100',
                          title: idea.title,
                          subtitle: idea.subtitle ?? '',
                          onTap: () {
                            if (idea.title == "Trade Idea") {
                              Get.to(() => const TradeIdea());
                            }

                            if (idea.title == "Strategy Share") {
                              Get.to(() => const StrategyShareScreen());
                            }

                            if (idea.title == "Market Analysis") {
                              Get.to(() => const MarketAnalysisScreen());
                            }

                            if (idea.title == "Question") {
                              Get.to(() => const QuestionScreen());
                            }

                            if (idea.title == "Success Story") {
                              Get.to(() => const SuccessStory());
                            }
                          },
                        );
                      },
                    ),
                  );
                }),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: AuthButton(
                  text: "Continue",
                  onTap: () {
                    Get.off(() => CommunityView());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
