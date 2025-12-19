import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';

class AppBackground {
  AppBackground._();

  static LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.bgColor2, AppColors.bgColor1],
  );
}
