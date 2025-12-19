import 'package:flutter/material.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../../../../global_widgets/appbar_header.dart';
import '../../../../../global_widgets/auth_button.dart';
import '../../../../../global_widgets/custom_textfield.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarHeader(title: "Change Password"),

              const SizedBox(height: 20),

              CustomTextField(
                hintText: "current password",
                containerColor: AppColors.tColor1.withOpacity(0.5),
              ),

              const SizedBox(height: 10),

              Divider(color: AppColors.tColor1),

              const SizedBox(height: 10),

              CustomTextField(
                hintText: "create new password",
                containerColor: AppColors.tColor1.withOpacity(0.5),
              ),

              const SizedBox(height: 10),

              CustomTextField(
                hintText: "confirm new password",
                containerColor: AppColors.tColor1.withOpacity(0.5),
              ),

              Spacer(),

              AuthButton(text: "Update", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
