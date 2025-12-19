import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/auth_button.dart';

class PlanCard extends StatelessWidget {
  final List<String> includes;
  final String title;
  final double price;
  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.includes,
    required this.title,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF29452A).withOpacity(0.25),
            Color(0xFF293645).withOpacity(0.3),
          ],
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AppImages.premium2, width: 45),
              const SizedBox(width: 10),

              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${title}\n",
                        style: AppTextStyles.title.copyWith(fontSize: 16),
                      ),
                      WidgetSpan(child: SizedBox(height: 17)),
                      TextSpan(
                        text: "Enjoy our affordable basic plan benefits.",
                        style: AppTextStyles.body.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "\$${price} ",
                  style: AppTextStyles.title.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textAmber,
                  ),
                ),
                WidgetSpan(child: SizedBox(height: 17)),
                TextSpan(
                  text: "/month",
                  style: AppTextStyles.title.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'This plan includes:',
            style: AppTextStyles.body.copyWith(
              fontSize: 12,
              color: AppColors.textPrimary.withOpacity(0.8),
            ),
          ),

          const SizedBox(height: 10),

          ...includes.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Image.asset(AppImages.checkMark, width: 20),
                  const SizedBox(width: 10),
                  Expanded(child: Text(item, style: AppTextStyles.body)),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          AuthButton(
            text: 'Subscribe',
            onTap: onTap,
            color: AppColors.textAmber.withOpacity(0.1),
            txtColor: AppColors.textAmber,
            isOutlined: true,
            outLineColor: AppColors.textAmber,
          ),
        ],
      ),
    );
  }
}
