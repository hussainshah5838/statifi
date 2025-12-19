import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

import '../data/controllers/expendable_container.dart';

class ExpandableContainer extends StatelessWidget {
  final String title;
  final String detail;
  final IconData? icon;
  final Color? bgColor;
  final Color? textColor;

  final ExpendableContainerController controller;

  const ExpandableContainer({
    super.key,
    required this.title,
    required this.detail,
    required this.controller,
    this.icon,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor ?? AppColors.tColor1.withOpacity(0.3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.title.copyWith(fontSize: 14),
                  ),
                ),

                GestureDetector(
                  onTap: controller.toggle,
                  child: Icon(
                    controller.isExpanded.value
                        ? icon ?? Icons.keyboard_arrow_up
                        : icon ?? Icons.keyboard_arrow_down,
                    color: textColor ?? Colors.white,
                  ),
                ),
              ],
            ),

            if (controller.isExpanded.value) ...[
              const SizedBox(height: 8),
              Divider(color: AppColors.tColor1),
              Text(detail, style: AppTextStyles.body),
            ],
          ],
        ),
      ),
    );
  }
}
