import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/app/module/user_profile/view/screens/subscription.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class CircularImageRow extends StatelessWidget {
  final String imagePath; // main circular image
  final String pencilIcon; // overlay pencil icon
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const CircularImageRow({
    Key? key,
    required this.imagePath,
    required this.pencilIcon,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.tColor1.withOpacity(0.4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circular image with pencil overlay
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(Subscription());
                },
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textAmber, width: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),
              ),
              Positioned(
                bottom: -5,
                right: -1,

                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(shape: BoxShape.circle),

                  child: Image.asset(pencilIcon, width: 17, height: 17),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // RichText
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "$title\n",
                            style: AppTextStyles.title.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(child: SizedBox(height: 17)),
                          TextSpan(
                            text: subtitle,
                            style: AppTextStyles.body.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
