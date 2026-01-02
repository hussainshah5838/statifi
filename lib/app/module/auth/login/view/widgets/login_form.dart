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
  final TextEditingController? passwordController;
  final TextEditingController? emailController;
  final TextEditingController? promoController;
  final bool? isForgotPassword;
  final bool? isPasswordField;
  final bool? isEmailField;
  final bool? isPromoCode;
  final String? hintText;
  final String? errorText;
  const LoginForm({
    super.key,
    this.passwordController,
    this.emailController,
    this.promoController,
    this.isForgotPassword = true,
    this.isPasswordField = true,
    this.isEmailField = true,
    this.hintText,
    this.errorText,
    this.isPromoCode = false,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final emailCtrl = emailController ?? TextEditingController();
    final promoCtrl = promoController ?? TextEditingController();

    return Column(
      children: [
        if (isEmailField == true)
          Obx(() {
            final emailErr = controller.isEmailError.value; // ✅ read Rx here

            return ValueListenableBuilder<TextEditingValue>(
              valueListenable: emailCtrl,
              builder: (context, emailValue, _) {
                final hasEmail = emailValue.text.trim().isNotEmpty;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      hintText: AppText.emailHint,
                      postfixImage: hasEmail ? AppImages.check : AppImages.mail,
                      controller: emailCtrl, // ✅ use emailCtrl
                      hasError: emailErr,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 8),

                    if (emailErr)
                      Row(
                        children: [
                          Image.asset(
                            AppImages.info,
                            color: Colors.red,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            errorText ?? "Invalid email",
                            style: AppTextStyles.body.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                  ],
                );
              },
            );
          }),

        if (isPromoCode == true)
          Obx(() {
            final promoErr = controller.isPromoCodeLink.value;

            return ValueListenableBuilder<TextEditingValue>(
              valueListenable: promoCtrl,
              builder: (context, promoValue, _) {
                final hasPromo = promoValue.text.trim().isNotEmpty;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      hintText: AppText.promoCodeHere,
                      postfixImage: hasPromo ? AppImages.check : AppImages.mail,
                      controller: promoCtrl,
                      hasError: promoErr,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 8),

                    if (promoErr)
                      Row(
                        children: [
                          Image.asset(
                            AppImages.info,
                            color: Colors.red,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            errorText ?? "invalid promo code or link",
                            style: AppTextStyles.body.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                  ],
                );
              },
            );
          }),

        // Password field
        if (isPasswordField == true)
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

                    if (isForgotPassword == true)
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
