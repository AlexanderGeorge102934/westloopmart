import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/authentication/screens/chat/chat_screen.dart';

/// --- Description of My Post --- ///
class TMyPostDescription extends StatelessWidget {
  const TMyPostDescription({
    super.key,
    required this.title,
    required this.user,
    required this.screenWidth,
    required this.screenHeight,
    required this.status,
    required this.statusColor,
    required this.chatId,
    required this.userId,
    required this.buttonColor,
    required this.buttonText,
  });

  final String title;
  final String user;
  final double screenWidth;
  final double screenHeight;
  final String status;
  final Color statusColor;
  final String chatId;
  final String userId;
  final Color buttonColor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          /// Title by User
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                "$title by $user",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ),
          ),


          SizedBox(height: screenHeight * 0.01), /// Spacing

          /// Status
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.02), /// Spacing

          /// Chat Button
          if (status == 'On Going')
            ElevatedButton(
              onPressed: () async {
                // final MessagesController messagesController = Get.put(MessagesController());
                // If the status is 'On Going', navigate to the existing chat
                Get.to(() => ChatScreen(chatId: chatId, userId: userId, otherUserId: userId));
              },
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
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