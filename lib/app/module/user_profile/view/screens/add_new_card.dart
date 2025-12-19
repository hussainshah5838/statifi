import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';
import 'package:statifi/routes/app_routes.dart';

import '../../../../../global_widgets/app_background.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Column(
            children: [
              AppbarHeader(title: "Add new card"),

              const SizedBox(height: 20),

              CustomTextField(hintText: 'card number'),

              const SizedBox(height: 10),

              CustomTextField(hintText: 'card holder name'),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(child: CustomTextField(hintText: 'expiry date')),
                  const SizedBox(width: 10),
                  Expanded(child: CustomTextField(hintText: 'CVV')),
                ],
              ),

              const SizedBox(height: 10),

              CustomTextField(hintText: 'Billing address'),

              Spacer(),

              AuthButton(
                text: 'Confirm',
                onTap: () => Get.offAllNamed(AppRoutes.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
