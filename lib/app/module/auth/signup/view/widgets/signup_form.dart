import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/auth/signup/controller/signup_controller.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';
import 'package:statifi/core/constants/app_texts.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final emailController = controller.emailController;
    final cEmailController = controller.cEmailController;
    final passwordController = controller.passwordController;
    final nameController = controller.nameController;

    return Column(
      children: [
        // Email Field
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: nameController,
          builder: (context, emailValue, _) {
            return CustomTextField(
              hintText: AppText.fullNameHint,
              postfixImage: emailValue.text.isNotEmpty
                  ? AppImages.check
                  : AppImages.person,
              controller: nameController,
              keyboardType: TextInputType.name,
            );
          },
        ),

        const SizedBox(height: 9),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: emailController,
          builder: (context, emailValue, _) {
            return CustomTextField(
              hintText: AppText.emailHint,
              postfixImage: emailValue.text.isNotEmpty
                  ? AppImages.check
                  : AppImages.mail,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            );
          },
        ),

        const SizedBox(height: 9),

        ValueListenableBuilder<TextEditingValue>(
          valueListenable: cEmailController,
          builder: (context, emailValue2, _) {
            return CustomTextField(
              hintText: AppText.emailHint,
              postfixImage: emailValue2.text.isNotEmpty
                  ? AppImages.check
                  : AppImages.mail,
              controller: cEmailController,
              keyboardType: TextInputType.emailAddress,
            );
          },
        ),

        const SizedBox(height: 9),

        // Password Field
        CustomTextField(
          hintText: AppText.passwordHint,
          isPassword: true,
          controller: passwordController,
        ),
      ],
    );
  }
}
