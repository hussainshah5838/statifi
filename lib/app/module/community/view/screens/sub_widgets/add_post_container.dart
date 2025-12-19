import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statifi/app/module/community/view/screens/community_post.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/auth_button.dart';

class AddPostContainer extends StatelessWidget {
  const AddPostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF29452A).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(AppImages.galleryEdit, width: 25),
          const SizedBox(width: 8),
          Text(
            'Want to say something...',
            style: AppTextStyles.title.copyWith(fontSize: 14),
          ),

          Spacer(),

          GestureDetector(
            onTap: () {
              Get.to(CommunityPost());
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.circular(14),
                color: AppColors.btnColor1,
              ),
              child: Text(
                "Create Post",
                style: AppTextStyles.heading2.copyWith(
                  color: AppColors.textBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
