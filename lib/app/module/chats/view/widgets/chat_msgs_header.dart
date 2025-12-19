import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/core/constants/app_images.dart';
import '../../../../../global_widgets/app_textstyle.dart';

class ChatMsgsHeader extends StatelessWidget {
  const ChatMsgsHeader({super.key});

  void _showOptionsPopup(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    showMenu<String>(
      context: context,
      color: const Color(0xFF1E2833),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      position: RelativeRect.fromLTRB(
        offset.dx + size.width - 200,
        offset.dy + size.height,
        offset.dx,
        offset.dy,
      ),
      items: [
        _buildPopupMenuItem("Clear Chat", "clear"),
        _buildPopupMenuItem("Block User", "block"),
        _buildPopupMenuItem("Move to Archive", "archive"),
      ],
    ).then((value) {
      if (value != null) {
        // Handle selection
      }
    });
  }

  PopupMenuItem<String> _buildPopupMenuItem(String text, String value) {
    return PopupMenuItem<String>(
      value: value,
      height: 40,
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(width: 15),
          const CircleAvatar(backgroundImage: AssetImage(AppImages.mocProfile)),
          const SizedBox(width: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Will Martin\n',
                  style: AppTextStyles.title.copyWith(fontSize: 18),
                ),
                TextSpan(
                  text: 'Last seen 03:44 pm',
                  style: AppTextStyles.body.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => _showOptionsPopup(context),
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
              child: Image.asset(AppImages.dotsY, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
