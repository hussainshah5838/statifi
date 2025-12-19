import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/app/module/auth/forgot/controllers/forgot_controller.dart';
import 'package:statifi/app/module/auth/forgot/view/widgets/forgot_form.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_sizes.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/app_texts.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../../../../global_widgets/auth_button.dart';
import '../../../../../global_widgets/custom_bottom_sheet.dart';
import '../../../../../global_widgets/google_button.dart';
import '../../../../../global_widgets/header.dart';
import '../../login/controller/login_controller.dart';

class ForgotView extends StatelessWidget {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotController());
    return Scaffold(
      body: Container(
        height: context.screeHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16),

        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: AppBackground.splashGradient),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: context.screeHeight * 0.17),
              AuthHeader(
                imagePath: AppImages.appLogo,
                title: AppText.forgotPasswordTitle,
                subtitle: AppText.forgotPasswordSubtitle,
              ),
              ForgotForm(emailController: controller.emailController),
              SizedBox(height: context.screeHeight * 0.22),
              SafeArea(
                child: Align(
                  // alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppText.backTo + " ",
                              style: AppTextStyles.body.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.textWhite,
                                fontSize: AppSizes.fontMedium,
                              ),
                            ),
                            TextSpan(
                              text: AppText.login,
                              style: AppTextStyles.body.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textSecondary,
                                fontSize: AppSizes.fontMedium,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: controller.emailController,
                        builder: (context, emailValue, _) {
                          final isEnabled = emailValue.text.isNotEmpty;
                          return Opacity(
                            opacity: isEnabled ? 1.0 : 0.5,
                            child: AuthButton(
                              text: AppText.sendVerification,
                              onTap: isEnabled
                                  ? () {
                                      controller.validateAll();
                                      CustomBottomSheet.show(
                                        context: context,
                                        imagePath: AppImages.verifyImg,
                                        title: AppText.mailSentTitle,
                                        subtitle1: AppText.mailSentSubtitle,
                                        buttonText: AppText.checkMail,
                                        onButtonTap: () {
                                          Get.back();
                                        },
                                      );
                                    }
                                  : () {},
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
