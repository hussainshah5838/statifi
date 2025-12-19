import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../global_widgets/app_textstyle.dart';
import '../../../../../../global_widgets/auth_button.dart';
import '../../../../../../global_widgets/custom_textfield.dart';
import '../../../controller/trading_preferences_controller.dart';

class TradingPreferencesContainer extends StatelessWidget {
  const TradingPreferencesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TradingPreferencesController());

    return Container(
      width: context.screenWidth,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.tColor1.withOpacity(0.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // trading preference
          Text(
            "Trading Preference",
            style: AppTextStyles.title.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.textAmber,
            ),
          ),

          const SizedBox(height: 15),

          Text("Default risk per trade (%)", style: AppTextStyles.body),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "2%",
            hintColor: Colors.white,
            postfixIcon: Icons.keyboard_arrow_down,
            iconColor: Colors.white,
          ),

          const SizedBox(height: 10),

          Text("Stop Loss Strategy", style: AppTextStyles.body),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "Percentage",
            hintColor: Colors.white,
            postfixIcon: Icons.keyboard_arrow_down,
            iconColor: Colors.white,
          ),

          const SizedBox(height: 10),
          Divider(color: AppColors.tColor1),
          const SizedBox(height: 10),

          // chart and analysis
          Text(
            "Chart & Analysis",
            style: AppTextStyles.title.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.textAmber,
            ),
          ),

          const SizedBox(height: 15),

          Text("Default Time frame", style: AppTextStyles.body),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "1 Hour",
            hintColor: Colors.white,
            postfixIcon: Icons.keyboard_arrow_down,
            iconColor: Colors.white,
          ),

          const SizedBox(height: 10),

          Text("Timezone", style: AppTextStyles.body),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "UTC",
            hintColor: Colors.white,
            postfixIcon: Icons.keyboard_arrow_down,
            iconColor: Colors.white,
          ),

          const SizedBox(height: 10),
          Divider(color: AppColors.tColor1),
          const SizedBox(height: 10),

          // platform settings
          Text(
            "Platform Settings",
            style: AppTextStyles.title.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.textAmber,
            ),
          ),
          const SizedBox(height: 10),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Auto-sync Trading Platforms\n",
                        style: AppTextStyles.title.copyWith(fontSize: 14),
                      ),
                      TextSpan(
                        text:
                            "Automatically sync trades from connected platforms",
                        style: AppTextStyles.body.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 20),

              Obx(
                () => Switch(
                  value: controller.autoSync.value,
                  activeThumbColor: Colors.black,
                  activeTrackColor: AppColors.textAmber,
                  onChanged: (val) {
                    controller.autoSync.value = val;
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Auto-sync Trading Platforms\n",
                        style: AppTextStyles.title.copyWith(fontSize: 14),
                      ),
                      TextSpan(
                        text:
                            "Automatically sync trades from connected platforms",
                        style: AppTextStyles.body.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 20),

              Obx(
                () => Switch(
                  value: controller.autoSync2.value,
                  activeThumbColor: Colors.black,
                  activeTrackColor: AppColors.textAmber,
                  onChanged: (val) {
                    controller.autoSync2.value = val;
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: AuthButton(
                  text: "Cancel",
                  color: AppColors.tColor1.withOpacity(0.4),
                  txtColor: AppColors.textPrimary,

                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AuthButton(text: "Save Changes", onTap: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
