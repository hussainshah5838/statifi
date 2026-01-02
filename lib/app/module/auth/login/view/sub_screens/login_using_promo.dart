import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';

import '../../../../../../core/constants/app_texts.dart';
import '../../../../../../global_widgets/app_background.dart';
import '../../../../../../global_widgets/auth_button.dart';
import '../../../../../../global_widgets/header.dart';
import '../../../../../../routes/app_routes.dart';
import '../../controller/login_controller.dart';
import '../widgets/login_form.dart';

class LoginUsingPromo extends StatelessWidget {
  const LoginUsingPromo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: context.screeHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: AppBackground.splashGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: context.screeHeight * 0.1),
            AuthHeader(
              title: AppText.loginViaPromo,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              subtitle: AppText.loginViaPromoDec,
            ),

            const SizedBox(height: 10),

            LoginForm(
              promoController: controller.promoController,
              isPromoCode: true,
              isForgotPassword: false,
              isPasswordField: false,
              isEmailField: false,
              errorText: "invalid promo code or link",
            ),

            Spacer(),

            ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller.promoController,
              builder: (context, promoValue, _) {
                final isEnabled = promoValue.text.isNotEmpty;

                return Opacity(
                  opacity: isEnabled ? 1.0 : 0.5,
                  child: AuthButton(
                    text: 'Continue',
                    onTap: isEnabled
                        ? () {
                            final isValid = controller.validPromoCodeLink();
                            if (isValid) {
                              Get.offNamed(AppRoutes.home);
                            }
                          }
                        : () {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
