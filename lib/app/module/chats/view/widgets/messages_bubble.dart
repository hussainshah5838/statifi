import 'package:flutter/material.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSender;
  final bool isSeen;

  const MessageBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isSender,
    this.isSeen = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isSender
        ? const Color(0xFF36CFE6).withOpacity(0.9)
        : const Color(0xFF293645).withOpacity(0.4);

    final textColor = isSender ? Colors.black : Colors.white;

    final align = isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Row(
            mainAxisAlignment: isSender
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      topRight: const Radius.circular(12),
                      bottomLeft: Radius.circular(isSender ? 12 : 0),
                      bottomRight: Radius.circular(isSender ? 0 : 12),
                    ),
                  ),
                  child: Text(
                    message,
                    style: AppTextStyles.title.copyWith(
                      color: textColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: isSender
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Text(
                time,
                style: AppTextStyles.body.copyWith(
                  color: Colors.white54,
                  fontSize: 10,
                ),
              ),
              if (isSender) ...[
                const SizedBox(width: 4),
                Icon(
                  isSeen ? Icons.done_all : Icons.done,
                  color: isSeen ? Colors.lightBlueAccent : Colors.white54,
                  size: 14,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
