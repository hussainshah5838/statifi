import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/app/module/auth/forgot/controllers/forgot_controller.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';
import 'package:statifi/core/constants/app_texts.dart';

import '../../../../../../global_widgets/app_textstyle.dart';

class ForgotForm extends StatelessWidget {
  final TextEditingController emailController;
  const ForgotForm({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotController());

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
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

        const SizedBox(height: 12),

        // footer section
      ],
    );
  }
}
