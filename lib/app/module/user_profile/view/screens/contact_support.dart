import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';

import '../../../../../global_widgets/app_background.dart';

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

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
              AppbarHeader(title: "Contact Support"),

              const SizedBox(height: 20),

              CustomTextField(
                hintText: "Medium - Technical Issue",
                hintColor: Colors.white,
                postfixIcon: Icons.keyboard_arrow_down,
                iconColor: Colors.white,
                containerColor: AppColors.tColor1.withOpacity(0.3),
              ),

              const SizedBox(height: 10),

              CustomTextField(
                hintText: "Subject",
                containerColor: AppColors.tColor1.withOpacity(0.3),
              ),

              const SizedBox(height: 10),

              CustomTextField(
                hintText: "please provide details about your issue*",
                containerColor: AppColors.tColor1.withOpacity(0.3),
                maxLine: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
