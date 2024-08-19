import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../../features/authentication/controllers/messages/messages_controller.dart';
import '../../features/authentication/screens/chat/chat_screen.dart';

class TMyPost extends StatelessWidget {
  const TMyPost({
    super.key,
    required this.user,
    required this.title ,
    required this.imageUrls,
    required this.status,
    required this.userId,
    required this.postId,
    required this.chatId,
  });

  final String user;
  final String title;
  final List<String> imageUrls;
  final String status;
  final String userId;
  final String postId;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    final tag = UniqueKey().toString();
    final ImageCarouselController controller = Get.put(ImageCarouselController(), tag: tag);

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    Color statusColor;
    String buttonText = '';
    Color buttonColor = Colors.blue;

    switch (status) {
      case 'Accepted':
        statusColor = Colors.green;
        buttonText = 'Send Message';
        break;
      case 'On Going':
        statusColor = Colors.orange;
        buttonText = 'Continue Chat';
        buttonColor = Colors.orangeAccent;
        break;
      case 'Offered':
      default:
        statusColor = Colors.yellow;
        break;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: SizedBox(
        height: screenHeight * 0.23,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: screenWidth * 0.005,
                      blurRadius: screenWidth * 0.0125,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  child: PageView.builder(
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: imageUrls[index],
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$title by $user",
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  if (status == 'On Going')
                    ElevatedButton(
                      onPressed: () async {
                        final MessagesController messagesController = Get.put(MessagesController());
                        // If the status is 'On Going', navigate to the existing chat
                        Get.to(() => ChatScreen(chatId: chatId, userId: userId, otherUserId: userId));

                      },
                      child: Text(buttonText),
                      style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}