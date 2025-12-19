import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';

import '../../../../../data/controllers/expendable_container.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/expendable_container.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});
  final c1 = ExpendableContainerController();
  final c2 = ExpendableContainerController();
  final c3 = ExpendableContainerController();
  final c4 = ExpendableContainerController();
  final c5 = ExpendableContainerController();
  final c6 = ExpendableContainerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          width: context.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppbarHeader(title: "Help Center"),

                const SizedBox(height: 20),

                ExpandableContainer(
                  title: "What is Balgo?",
                  detail:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  icon: CupertinoIcons.plus,
                  controller: c1,
                ),

                ExpandableContainer(
                  title: "Lorem ipsum dolor iust amet?",
                  detail:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  icon: CupertinoIcons.plus,
                  controller: c2,
                ),

                ExpandableContainer(
                  title: "Lorem ipsum dolor iust amet?",
                  detail:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  icon: CupertinoIcons.plus,
                  controller: c3,
                ),
                ExpandableContainer(
                  title: "Lorem ipsum dolor iust amet?",
                  detail:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  icon: CupertinoIcons.plus,
                  controller: c4,
                ),
                ExpandableContainer(
                  title: "Lorem ipsum dolor iust amet?",
                  detail:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  icon: CupertinoIcons.plus,
                  controller: c5,
                ),
                ExpandableContainer(
                  title: "Lorem ipsum dolor iust amet?",
                  detail:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  icon: CupertinoIcons.plus,
                  controller: c6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
