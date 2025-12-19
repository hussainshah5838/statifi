import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../global_widgets/app_textstyle.dart';

class CardTile extends StatelessWidget {
  final String name;
  final String nText;
  final bool isConnected;

  const CardTile({
    super.key,
    required this.name,
    required this.nText,
    required this.isConnected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // LEFT CIRCLE
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isConnected
                ? const Color(0xFF3B82F6).withOpacity(0.1)
                : AppColors.textAmber.withOpacity(0.15),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              nText,
              textAlign: TextAlign.center,
              style: AppTextStyles.title.copyWith(fontSize: 12),
            ),
          ),
        ),

        const SizedBox(width: 10),

        // NAME
        Text(name, style: AppTextStyles.title.copyWith(fontSize: 16)),

        const Spacer(),

        // CONNECT / COMING SOON BUTTON
        Container(
          alignment: Alignment.center,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: isConnected
                ? const Color(0xFF49DD7F).withOpacity(0.05)
                : AppColors.textAmber.withOpacity(0.15),
            border: Border.all(
              color: isConnected
                  ? const Color(0xFF49DD7F)
                  : AppColors.textAmber,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 1.5),
            child: Text(
              isConnected ? 'Connect' : 'Coming Soon',
              textAlign: TextAlign.center,
              style: AppTextStyles.title.copyWith(
                fontSize: 12,
                color: isConnected ? AppColors.textGreen : AppColors.textAmber,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
