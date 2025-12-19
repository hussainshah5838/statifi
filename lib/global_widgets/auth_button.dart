import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isOutlined;
  final IconData? icon;
  final Color? color;
  final Color? txtColor;
  final Color? outLineColor;
  final double? txtSize;

  const AuthButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isOutlined = false,
    this.icon,
    this.color,
    this.txtColor,
    this.outLineColor,
    this.txtSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 53,
        decoration: BoxDecoration(
          color: isOutlined
              ? color ?? Colors.transparent
              : color ?? AppColors.btnColor1,
          borderRadius: BorderRadius.circular(14),
          border: isOutlined
              ? Border.all(
                  color: outLineColor ?? AppColors.textPrimary,
                  width: 1.5,
                )
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.heading2.copyWith(
              color:
                  txtColor ??
                  (isOutlined ? AppColors.textPrimary : AppColors.textBlack),
              fontWeight: FontWeight.w500,
              fontSize: txtSize ?? 17,
            ),
          ),
        ),
      ),
    );
  }
}
