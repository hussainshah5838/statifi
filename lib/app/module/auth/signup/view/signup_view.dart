import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/auth/signup/controller/signup_controller.dart';
import 'package:statifi/app/module/auth/signup/view/widgets/signup_form.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/routes/app_routes.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/app_texts.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../../../../global_widgets/google_button.dart';
import '../../../../../global_widgets/header.dart';
import '../../../../../global_widgets/auth_button.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

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
              SizedBox(height: context.screeHeight * 0.06),

              /// Header
              AuthHeader(
                imagePath: AppImages.appLogo,
                title: AppText.createAccount,
                subtitle: AppText.createAccountSubtitle,
              ),

              const SignupForm(),

              SizedBox(height: context.screeHeight * 0.03),

              /// Footer Section
              SafeArea(
                child: Column(
                  children: [
                    // Remember Me
                    Row(
                      children: [
                        Obx(
                          () => Transform.scale(
                            scale: 1.7,
                            child: Checkbox(
                              value: controller.rememberMe.value,
                              onChanged: (val) {
                                controller.rememberMe.value = val ?? false;
                              },
                              activeColor: AppColors.btnColor1,
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                (states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return AppColors.btnColor1;
                                  }
                                  return AppColors.tColor1;
                                },
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(width: 8),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: AppText.agreeText + " ",
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.textWhite,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: AppText.termsAndConditions,
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: controller.emailController,
                      builder: (context, emailValue, _) {
                        return ValueListenableBuilder<TextEditingValue>(
                          valueListenable: controller.passwordController,
                          builder: (context, passwordValue, __) {
                            final isEnabled =
                                emailValue.text.isNotEmpty &&
                                passwordValue.text.isNotEmpty;

                            return Opacity(
                              opacity: isEnabled ? 1.0 : 0.5,
                              child: AuthButton(
                                text: 'Continue',
                                onTap: isEnabled
                                    ? () {
                                        print('Continue tapped');
                                      }
                                    : () {},
                              ),
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    Image.asset(AppImages.line),
                    const SizedBox(height: 20),

                    GoogleContinueButton(
                      onTap: () {
                        print('Google sign-in tapped');
                      },
                    ),

                    const SizedBox(height: 15),

                    // Back to Login
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            // text: "${AppText.alreadyAccount} ",
                            text: AppText.alreadyAccount,
                            style: AppTextStyles.body.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.textWhite,
                            ),
                          ),
                          TextSpan(
                            text: AppText.login,
                            style: AppTextStyles.body.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed(AppRoutes.login);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
