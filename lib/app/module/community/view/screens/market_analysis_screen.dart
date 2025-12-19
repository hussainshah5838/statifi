import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/community/view/screens/sub_widgets/rich_text_switch.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../../../../global_widgets/appbar_header.dart';
import '../../../../../global_widgets/auth_button.dart';
import '../../../../../global_widgets/custom_textfield.dart';
import '../../controller/market_analysis_controller.dart';

class MarketAnalysisScreen extends StatelessWidget {
  const MarketAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MarketAnalysisController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarHeader(title: "Market Analysis"),

              const SizedBox(height: 20),

              Text("Title", style: AppTextStyles.body),
              const SizedBox(height: 10),
              CustomTextField(hintText: "enter your title..."),

              const SizedBox(height: 15),

              Text("Content", style: AppTextStyles.body),
              const SizedBox(height: 10),
              CustomTextField(hintText: "Share in detail...", maxLine: 4),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tags (Optional)", style: AppTextStyles.body),
                  Text(
                    "+ add more tags",
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.btnColor1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: "# add tags (e.g. EURUSD, breakout, scalping)",
              ),
              const SizedBox(height: 10),
              Text(
                "Add upto 5 tags to help others find your post)",
                style: AppTextStyles.body.copyWith(color: Colors.white30),
              ),
              const SizedBox(height: 10),
              Divider(color: AppColors.tColor1),
              const SizedBox(height: 15),

              RichTextSwitchContainer(
                title: "Make post public",
                subtitle: "Public post are visible to all community members.",
                switchValue: controller.isExtraInfoEnabled,
                onChanged: (value) {
                  controller.isExtraInfoEnabled.value = value;
                },
              ),

              const SizedBox(height: 20),

              Spacer(),

              AuthButton(text: "Post now", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
