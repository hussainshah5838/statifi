import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF293645).withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: AppTextStyles.body.copyWith(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Type your message here...",
                        hintStyle: AppTextStyles.body.copyWith(fontSize: 14),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),

                  // Camera icon
                  IconButton(
                    icon: Image.asset(AppImages.camera, height: 30),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 8),

          GestureDetector(
            onTap: () {
              // handle send
            },
            child: SizedBox(
              width: 55,
              height: 55,
              child: Center(
                child: Image.asset(AppImages.sendBtn, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
