import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/extentions/custom_painters.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../../../../global_widgets/profile_drawer.dart';

class JournalSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF29452A).withOpacity(0.4),
            Color(0xFF293645).withOpacity(0.4),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_month, color: AppColors.textWhite),
              const SizedBox(width: 10),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Trading Journal\n',
                      style: AppTextStyles.title.copyWith(fontSize: 16),
                    ),
                    WidgetSpan(child: const SizedBox(height: 20)),
                    TextSpan(
                      text: 'Track daily performance and strategy notes.',
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          GestureDetector(
            onTap: () {
              AppDialogs.strategyNoteSheet(context: context);
            },
            child: Container(
              alignment: Alignment.center,
              height: 47,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: AppColors.textAmber.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: DottedBorder(
                  color: AppColors.textAmber.withOpacity(0.7),
                  strokeWidth: 1.5,
                  dashWidth: 8.0,
                  dashGap: 4.0,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 1.5),
                  child: Text(
                    '+ Add Strategy note',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.title.copyWith(
                      fontSize: 14,
                      color: AppColors.textAmber.withOpacity(0.9),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
