import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'app_textstyle.dart';

class AppbarHeader extends StatelessWidget {
  final String? title;
  final String? img;
  final String? rightRawImage;
  final String? backImg;
  final VoidCallback? onBackTap;
  final VoidCallback? onImageTap;

  const AppbarHeader({
    super.key,
    this.title,
    this.img,
    this.rightRawImage,
    this.backImg,
    this.onBackTap,
    this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      child: Row(
        children: [
          GestureDetector(
            onTap: onBackTap ?? () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),

              child: backImg != null
                  ? Image.asset(
                      backImg!,
                      height: 25,
                      width: 25,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
            ),
          ),

          const SizedBox(width: 10),

          Text(title ?? "", style: AppTextStyles.title.copyWith(fontSize: 18)),

          const Spacer(),

          if (rightRawImage != null) ...[
            GestureDetector(
              onTap: onImageTap,
              child: Image.asset(
                rightRawImage!,
                height: 45,
                width: 45,
                fit: BoxFit.contain,
              ),
            ),
          ] else if (img != null) ...[
            GestureDetector(
              onTap: onImageTap,
              child: Container(
                height: 55,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: Colors.white.withOpacity(0.05),
                  ),
                ),
                child: Image.asset(img!, fit: BoxFit.contain),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
