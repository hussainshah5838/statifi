import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';
import 'package:statifi/core/constants/app_texts.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/routes/app_routes.dart';
import '../../../../../../global_widgets/google_button.dart';
import '../../controller/login_controller.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController emailController;
  const LoginForm({
    super.key,
    required this.passwordController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    // final emailController = controller.emailController;
    // final passwordController = controller.passwordController;

    return Column(
      children: [
        // Email field
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: emailController,
          builder: (context, emailValue, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  hintText: AppText.emailHint,
                  postfixImage: emailValue.text.isNotEmpty
                      ? AppImages.check
                      : AppImages.mail,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8),
                // Email error message
                Obx(
                  () => controller.isEmailError.value
                      ? Row(
                          children: [
                            Image.asset(
                              AppImages.info,
                              color: Colors.red,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "Invalid email",
                              style: AppTextStyles.body.copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            );
          },
        ),

        // Password field
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                hintText: AppText.passwordHint,
                isPassword: true,
                controller: passwordController,
                hasError: controller.isPasswordError.value,
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (controller.isPasswordError.value) ...[
                    Image.asset(
                      AppImages.info,
                      color: Colors.red,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      AppText.invalidPassword,
                      style: AppTextStyles.body.copyWith(color: Colors.red),
                    ),
                  ],

                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgot);
                        },
                        child: Text(
                          AppText.forgotPassword,
                          style: AppTextStyles.body.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // footer section
      ],
    );
  }
}
