import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../controller/community_controller.dart';

class TradersView extends GetView<CommunityController> {
  const TradersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.traders.isEmpty) return const SizedBox();
      return ListView.builder(
        itemCount: controller.traders.length,
        itemBuilder: (context, index) {
          final trader = controller.traders[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.tColor1,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      trader.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// TEXTS (TITLE + SUBTITLE)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trader.title,
                          style: AppTextStyles.title.copyWith(fontSize: 15),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          trader.subtitle,
                          style: AppTextStyles.body.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// BUTTON
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF36CFE6).withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      trader.buttonText,
                      style: AppTextStyles.title.copyWith(
                        fontSize: 14,
                        color: Color(0xFF36CFE6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
