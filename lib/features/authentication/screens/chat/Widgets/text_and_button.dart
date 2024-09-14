import 'package:flutter/material.dart';
import 'package:startup_app/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../controllers/messages/messages_controller.dart';

/// --- Text and Button Chat --- ///
class TTextAndButtonChat extends StatelessWidget {
  const TTextAndButtonChat({
    super.key,
    required MessagesController messagesController,
    required this.chatId,
    required this.userId,
    required this.otherUserId,
  }) : _messagesController = messagesController;

  final MessagesController _messagesController;
  final String chatId;
  final String userId;
  final String otherUserId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(TSizes.defaultSpace(context) * 0.6),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messagesController.message,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(TSizes.defaultSpace(context) * 0.6),
                  borderSide: const BorderSide(color: TColors.primary),
                ),
                filled: true,
                fillColor: Colors.blue.withOpacity(0.1),
                hintText: 'Type a message...',
                hintStyle: const TextStyle(color: TColors.textPrimary),
              ),
              style: const TextStyle(color: TColors.black),
            ),
          ),

          SizedBox(width: TSizes.spaceBtwItems(context)),

          ElevatedButton(
            onPressed: () async {
              await _messagesController.sendMessage(
                _messagesController.message.text,
                chatId,
                userId,
                otherUserId,
              );
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), backgroundColor: TColors.primary,
              padding: EdgeInsets.all(TSizes.defaultSpace(context) * 0.6),
            ),
            child: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}