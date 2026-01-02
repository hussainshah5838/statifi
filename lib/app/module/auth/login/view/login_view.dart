import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/app/module/auth/login/view/sub_screens/login_using_promo.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/header.dart';
import 'package:statifi/app/module/auth/login/view/widgets/login_form.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/routes/app_routes.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_texts.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../../../../global_widgets/auth_button.dart';
import '../../../../../global_widgets/google_button.dart';
import '../controller/login_controller.dart';
import 'package:flutter/gestures.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
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
              SizedBox(height: context.screeHeight * 0.1),
              AuthHeader(
                imagePath: AppImages.appLogo,
                title: AppText.loginTitle,
                subtitle: AppText.loginSubtitle,
              ),
              LoginForm(
                emailController: controller.emailController,
                passwordController: controller.passwordController,
              ),
              SizedBox(height: context.screeHeight * 0.06),
              SafeArea(
                child: Align(
                  // alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Transform.scale(
                              scale: 1.6,
                              child: Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: (val) {
                                  controller.rememberMe.value = val ?? false;
                                },
                                activeColor: AppColors.btnColor1,
                                side: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                ),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                fillColor:
                                    WidgetStateProperty.resolveWith<Color>((
                                      states,
                                    ) {
                                      if (states.contains(
                                        WidgetState.selected,
                                      )) {
                                        return AppColors.btnColor1;
                                      }
                                      return AppColors.tColor1;
                                    }),
                              ),
                            ),
                          ),
                          // const SizedBox(width: 3),
                          Text(
                            AppText.rememberMe,
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.w500,
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
                                          final isValid = controller
                                              .validateAll();
                                          if (isValid) {
                                            Get.offNamed(AppRoutes.home);
                                          }
                                        }
                                      : () {},
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      // Divider
                      Image.asset(AppImages.line),
                      const SizedBox(height: 20),

                      AuthButton(
                        text: "Login using promo code/Link",
                        color: AppColors.tColor1,
                        txtColor: AppColors.textWhite,

                        onTap: () => Get.to(() => LoginUsingPromo()),
                      ),

                      const SizedBox(height: 15),

                      // Google button
                      GoogleContinueButton(
                        onTap: () {
                          print('Google sign-in tapped');
                        },
                      ),
                      const SizedBox(height: 15),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${AppText.haventAccount} ",
                              style: AppTextStyles.body.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.textWhite,
                                fontSize: AppSizes.fontMedium,
                              ),
                            ),
                            TextSpan(
                              text: AppText.signUP,
                              style: AppTextStyles.body.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textSecondary,
                                fontSize: AppSizes.fontMedium,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(AppRoutes.signup);
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
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
