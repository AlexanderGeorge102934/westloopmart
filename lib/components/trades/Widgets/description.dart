import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/authentication/controllers/messages/messages_controller.dart';
import '../../../features/authentication/screens/chat/chat_screen.dart';
import '../../../utils/constants/sizes.dart';

/// --- Description of Trade --- ///
class TDescriptionOfTrade extends StatelessWidget {
  const TDescriptionOfTrade({
    super.key,
    required this.titleOfPost,
    required this.userOfPost,
    required this.screenHeight,
    required this.titleOfOffer,
    required this.screenWidth,
    required this.statusOfOffer,
    required this.statusColor,
    required this.chatId,
    required this.userId1,
    required this.userId2,
    required this.offerId,
    required this.postId,
    required this.buttonColor,
    required this.buttonText,
  });

  final String titleOfPost;
  final String userOfPost;
  final double screenHeight;
  final String titleOfOffer;
  final double screenWidth;
  final String statusOfOffer;
  final Color statusColor;
  final String? chatId;
  final String userId1;
  final String userId2;
  final String offerId;
  final String postId;
  final Color buttonColor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                "$titleOfPost by $userOfPost",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: TSizes.fontSizeXl(context),
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.01), /// Spacing

          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                "You offered $titleOfOffer",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01), /// Spacing

          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                statusOfOffer,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.01), /// Spacing

          /// Conditional rendering of the button based on the status
          if (statusOfOffer == 'Accepted' || statusOfOffer == 'On Going')
            ElevatedButton(
              onPressed: () async {
                final MessagesController messagesController = Get.put(MessagesController());

                if (statusOfOffer == 'On Going' && chatId != null) {
                  // If the status is 'On Going' and a chatId exists, navigate to the existing chat
                  Get.to(() => ChatScreen(chatId: chatId!, userId: userId1, otherUserId: userId2));
                } else if (statusOfOffer == 'Accepted') {
                  // If the status is 'Accepted', create a new chat
                  final String? newChatId = await messagesController.createChat(userId1, userId2, offerId, postId); ///Fix security rule to change chat id only of post

                  if (newChatId != null) {
                    Get.to(() => ChatScreen(chatId: newChatId, userId: userId1, otherUserId: userId2));
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: buttonColor,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(buttonText),
              ),
            ),
        ],
      ),
    );
  }
}