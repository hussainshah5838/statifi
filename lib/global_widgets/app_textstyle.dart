import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';

class AppTextStyles {
  AppTextStyles._();

  // Base font family
  static const String _fontFamily = 'Satoshi';

  // Headings
  static TextStyle heading1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppSizes.fontLarge,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle heading2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppSizes.fontMedium,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
  static TextStyle title = TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppSizes.textTitle,
    fontWeight: FontWeight.w500,
    color: AppColors.textWhite,
  );

  // Body text
  static TextStyle body = TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppSizes.fontMedium,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle smallText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppSizes.fontSmall,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  // Buttons
  // static TextStyle button = TextStyle(
  //   fontFamily: _fontFamily,
  //   fontSize: AppSizes.fontMedium,
  //   fontWeight: FontWeight.w600,
  //   color: AppColors.white,
  // );
}
