import 'package:flutter/material.dart';
import 'package:statifi/app/module/chats/view/widgets/chat_msgs_header.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/appbar_header.dart';

import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../widgets/chat_input_filed.dart';
import '../widgets/messages_bubble.dart';

class ChatViewMsgs extends StatelessWidget {
  ChatViewMsgs({super.key});

  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hello there ! Hope you are doing well',
      'time': '03:44 PM',
      'isSender': false,
    },

    {
      'text':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      'time': '03:46 PM',
      'isSender': false,
    },
    {'text': 'I’m doing good', 'time': '03:47 PM', 'isSender': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                ChatMsgsHeader(),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF293645).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Yesterday',
                      style: AppTextStyles.title.copyWith(fontSize: 14),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      return MessageBubble(
                        message: msg['text']!,
                        time: msg['time']!,
                        isSender: msg['isSender']!,
                        isSeen: msg['isSender']!,
                      );
                    },
                  ),
                ),

                const ChatInputField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
