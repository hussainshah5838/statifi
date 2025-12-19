import 'package:flutter/material.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';

class AddTradeBottomSheet extends StatelessWidget {
  const AddTradeBottomSheet({super.key});

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

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Add new trade\n",
                  style: AppTextStyles.title.copyWith(fontSize: 20),
                ),
                TextSpan(
                  text: "Please enter the correct information to add trade.",
                  style: AppTextStyles.body.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          CustomTextField(hintText: 'symbol e.g. EUR, USD'),

          const SizedBox(height: 15),

          CustomTextField(
            hintText: 'Buy',
            postfixIcon: Icons.keyboard_arrow_down_sharp,
            iconColor: Colors.white,
            hintColor: Colors.white,
          ),

          const SizedBox(height: 15),
          CustomTextField(
            hintText: 'MetaTrader 4',
            postfixIcon: Icons.keyboard_arrow_down_sharp,
            iconColor: Colors.white,
            hintColor: Colors.white,
          ),

          const SizedBox(height: 15),
          CustomTextField(
            hintText: 'Forex',
            postfixIcon: Icons.keyboard_arrow_down_sharp,
            iconColor: Colors.white,
            hintColor: Colors.white,
          ),

          const SizedBox(height: 15),

          CustomTextField(hintText: 'lot size e.g. 0.1'),

          const SizedBox(height: 15),
          CustomTextField(hintText: 'entry price e.g. `1.0657'),

          const SizedBox(height: 15),
          CustomTextField(hintText: 'contract size e.g. 60'),

          const SizedBox(height: 15),
          CustomTextField(hintText: 'trade notes', maxLine: 3),

          const SizedBox(height: 40),
          AuthButton(text: "Add Trade", onTap: () {}),
        ],
      ),
    );
  }
}
