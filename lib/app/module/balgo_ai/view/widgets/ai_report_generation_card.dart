import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class AiReportGenerationCard extends StatelessWidget {
  final Color cColor1;
  final Color cColor2;
  final String img;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const AiReportGenerationCard({
    super.key,
    required this.cColor1,
    required this.cColor2,
    required this.img,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [cColor1, cColor2],
          ),
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(img, width: 34),
                Icon(
                  CupertinoIcons.arrow_up_right,
                  size: 18,
                  color: Colors.white,
                ),
              ],
            ),

            const SizedBox(height: 15),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${title}\n',
                    style: AppTextStyles.title.copyWith(fontSize: 15),
                  ),
                  WidgetSpan(child: const SizedBox(height: 20)),
                  TextSpan(
                    text: subtitle,
                    style: AppTextStyles.body.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
