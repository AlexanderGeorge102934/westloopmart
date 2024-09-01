import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/features/authentication/screens/chat/chat_screen.dart';
import 'package:startup_app/utils/constants/sizes.dart';
import '../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../../features/authentication/controllers/messages/messages_controller.dart';

class TTrades extends StatelessWidget {
  const TTrades({
    super.key,
    required this.titleOfOffer,
    required this.imageUrls,
    required this.statusOfOffer,
    required this.userOfPost,
    required this.titleOfPost,
    required this.userId1,
    required this.userId2,
    required this.chatId,
    required this.offerId,
    required this.postId,
  });

  final String userOfPost;
  final String titleOfPost;
  final String titleOfOffer;
  final List<String> imageUrls;
  final String statusOfOffer;
  final String userId1;
  final String userId2;
  final String? chatId;  // New parameter to track existing chat ID
  final String offerId;
  final String postId;

  @override
  Widget build(BuildContext context) {
    final tag = UniqueKey().toString();
    final ImageCarouselController controller = Get.put(ImageCarouselController(), tag: tag);

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    // Define appearance based on the status
    Color statusColor;
    String buttonText = '';
    Color buttonColor = Colors.blue;

    switch (statusOfOffer) {
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
        height: screenHeight * 0.2,
        child: Row(
          children: [
            /// Image Carousel
            Flexible(
              child: AspectRatio(
                aspectRatio: 2 / 3, // Maintain a consistent aspect ratio
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
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
            ),
            SizedBox(width: screenWidth * 0.04),
            Flexible(
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
                  SizedBox(height: screenHeight * 0.01),
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
                  SizedBox(height: screenHeight * 0.01),
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
                  SizedBox(height: screenHeight * 0.01),

                  // Conditional rendering of the button based on the status
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
            ),
          ],
        ),
      ),
    );
  }
}
