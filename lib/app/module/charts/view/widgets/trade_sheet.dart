import 'package:flutter/material.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';

class TradeSheet extends StatelessWidget {
  const TradeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.screeHeight / 1.73,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color(0xFF0C121A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 43,
              height: 5,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Add Price alert\n',
                  style: AppTextStyles.title.copyWith(fontSize: 20),
                ),

                TextSpan(
                  text:
                      'Please enter the correct information to add new price alert.',
                  style: AppTextStyles.body.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Text('Currency', style: AppTextStyles.body),

          const SizedBox(height: 10),

          CustomTextField(
            hintText: 'USD',
            hintColor: Colors.white,
            postfixIcon: Icons.keyboard_arrow_down,
            iconColor: Colors.white,
          ),

          const SizedBox(height: 15),

          Text('Price', style: AppTextStyles.body),

          const SizedBox(height: 10),

          CustomTextField(hintText: 'Target price here...'),

          const SizedBox(height: 15),

          Text('Target', style: AppTextStyles.body),

          const SizedBox(height: 10),

          CustomTextField(
            hintText: 'Price above target',
            hintColor: Colors.white,
            postfixIcon: Icons.keyboard_arrow_down,
            iconColor: Colors.white,
          ),

          const SizedBox(height: 25),

          AuthButton(
            text: "Add Alert",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
