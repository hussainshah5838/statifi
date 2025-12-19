import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController rotationController;
  late Animation<double> rotation;
  late Animation<double> scale;

  @override
  void onInit() {
    super.onInit();

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    rotation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: rotationController, curve: Curves.easeInOut),
    );

    scale = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: rotationController, curve: Curves.easeInOut),
    );
  }

  @override
  void onClose() {
    rotationController.dispose();
    super.onClose();
  }
}
