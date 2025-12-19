import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class TradeIdeaCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const TradeIdeaCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  State<TradeIdeaCard> createState() => _TradeIdeaCardState();
}

class _TradeIdeaCardState extends State<TradeIdeaCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.tColor1.withOpacity(0.3),
          border: isSelected
              ? Border.all(color: const Color(0xFF36CFE6), width: 1)
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(widget.image, fit: BoxFit.cover, width: 30),
                    if (isSelected)
                      Image.asset(
                        AppImages.check,
                        fit: BoxFit.cover,
                        width: 20,
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: AppTextStyles.body.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 2),
            Text(
              widget.subtitle,
              style: AppTextStyles.body.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
