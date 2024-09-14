import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/utils/constants/colors.dart';
import 'package:startup_app/utils/constants/sizes.dart';

import '../../controllers/messages/messages_controller.dart';
import 'Methods/chat_stream_builder.dart';
import 'Widgets/text_and_button.dart';

/// --- Chat Screen --- ///
class ChatScreen extends StatelessWidget {
  final String chatId;
  final String userId;
  final String otherUserId;

  ChatScreen({super.key, required this.chatId, required this.userId, required this.otherUserId});

  final MessagesController _messagesController = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: TSizes.fontSizeXXl(context),
          ),
        ),
        backgroundColor: TColors.borderSecondary,
        elevation: 0,
      ),
      body: Column(
        children: [

          /// Stream Builder of Chat
          TChatStreamBuilder(chatId, userId),

          /// Text and send button
          TTextAndButtonChat(messagesController: _messagesController, chatId: chatId, userId: userId, otherUserId: otherUserId),
        ],
      ),
    );
  }
}