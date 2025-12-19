import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_images.dart';
import '../../../../../../global_widgets/app_textstyle.dart';
import '../../../../../../global_widgets/auth_button.dart';
import '../../../../../../global_widgets/common_header.dart';
import '../../../../../../global_widgets/custom_textfield.dart';

class Mt4AccountSheet extends StatelessWidget {
  const Mt4AccountSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),

          CommonHeader(
            title: "Add Metatrader Account",
            subtitle:
                "Please enter the correct information to add new trading platform.",
          ),

          const SizedBox(height: 20),

          CustomTextField(
            hintText: 'MT4',
            hintColor: Colors.white,
            postfixIcon: Icons.keyboard_arrow_down,
            iconColor: Colors.white,
          ),

          const SizedBox(height: 15),

          CustomTextField(hintText: 'platform name'),

          const SizedBox(height: 15),

          CustomTextField(
            hintText: 'select broker',
            hintColor: Colors.white,
            postfixIcon: Icons.keyboard_arrow_down,
            iconColor: Colors.white,
          ),

          const SizedBox(height: 15),
          CustomTextField(
            hintText: 'select server',
            hintColor: Colors.white,
            postfixIcon: Icons.keyboard_arrow_down,
            iconColor: Colors.white,
          ),

          const SizedBox(height: 15),

          Text(
            'Login credentials',
            style: AppTextStyles.title.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textAmber,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),

          CustomTextField(hintText: 'ID'),

          const SizedBox(height: 15),
          CustomTextField(hintText: 'investor password'),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.info, color: Colors.white30, width: 23),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  'Use your investor password for secure read-only access',
                  style: AppTextStyles.body,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: AuthButton(
                  text: "Test Connection",
                  onTap: () {},
                  color: AppColors.tColor1,
                  txtColor: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: AuthButton(text: "Add", onTap: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
