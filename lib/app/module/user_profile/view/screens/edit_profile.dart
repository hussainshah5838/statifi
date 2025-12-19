import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/app_textstyle.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          width: context.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarHeader(title: "Edit Profile"),

              const SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.tColor1.withOpacity(0.5),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.mocProfile),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Upload Profile Photo\n",
                              style: AppTextStyles.title.copyWith(fontSize: 16),
                            ),
                            WidgetSpan(child: const SizedBox(height: 17)),
                            TextSpan(
                              text: "File size (100 mb max)",
                              style: AppTextStyles.body.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.textAmber.withOpacity(0.23),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.textAmber,
                          width: 0.7,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Upload',
                            style: AppTextStyles.body.copyWith(
                              fontSize: 12,
                              color: AppColors.textAmber,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.textAmber,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Divider(color: AppColors.tColor1),

              const SizedBox(height: 10),

              Text(
                'PERSONAL INFORMATION',
                style: AppTextStyles.title.copyWith(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 15),

              CustomTextField(
                hintText: "Kevin Backer",
                hintColor: Colors.white,
                containerColor: AppColors.tColor1.withOpacity(0.5),
              ),

              const SizedBox(height: 10),

              CustomTextField(
                hintText: "kevinbacker234@gmail.com",
                hintColor: Colors.white,
                containerColor: AppColors.tColor1.withOpacity(0.5),
              ),

              const SizedBox(height: 10),

              CustomTextField(
                hintText: "+91 67867876 7",
                hintColor: Colors.white,
                containerColor: AppColors.tColor1.withOpacity(0.5),
              ),

              const SizedBox(height: 10),

              CustomTextField(
                hintText: "California, USA",
                hintColor: Colors.white,
                containerColor: AppColors.tColor1.withOpacity(0.5),
              ),

              Spacer(),

              AuthButton(text: "Update", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
