import 'package:flutter/material.dart';
import 'package:statifi/app/module/user_profile/view/screens/screens_widgets/my_downloads_card.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/appbar_header.dart';

import '../../../../../global_widgets/app_background.dart';

class MyDownloads extends StatelessWidget {
  const MyDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          width: context.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Column(
            children: [
              AppbarHeader(title: "My Downloads"),

              const SizedBox(height: 10),

              MyDownloadsCard(),

              const SizedBox(height: 10),

              MyDownloadsCard(),

              const SizedBox(height: 10),

              MyDownloadsCard(),

              const SizedBox(height: 10),

              MyDownloadsCard(),

              const SizedBox(height: 10),

              MyDownloadsCard(),

              const SizedBox(height: 10),

              MyDownloadsCard(),

              const SizedBox(height: 10),

              MyDownloadsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
