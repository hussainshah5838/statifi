import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/controllers/animation_controller.dart';

class AnimatedAiImage extends StatelessWidget {
  final String imagePath;
  AnimatedAiImage({super.key, required this.imagePath});

  final AiAnimationController controller = Get.put(AiAnimationController());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.rotationController,
      builder: (_, child) {
        return Transform.rotate(
          angle: controller.rotation.value,
          child: Transform.scale(scale: controller.scale.value, child: child),
        );
      },
      child: Container(
        width: 250,
        height: 250,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ai_back.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
