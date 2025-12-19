import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class RichTextSwitchContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final RxBool switchValue;
  final void Function(bool)? onChanged;

  const RichTextSwitchContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.switchValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.tColor1.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Make post public",
                  style: AppTextStyles.title.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 6),
                Text(
                  "Public post are visible to all community members.",
                  style: AppTextStyles.body.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Obx(
            () => Switch(
              value: switchValue.value,
              activeTrackColor: AppColors.btnColor1,
              activeThumbColor: Colors.black,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
