import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import 'Widgets/description.dart';
import 'Widgets/image_carousel.dart';


/// --- My Post Widget --- ///
class TMyPost extends StatelessWidget {
  const TMyPost({
    super.key,
    required this.user,
    required this.title,
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
        height: screenHeight * 0.2,
        child: Row(
          children: [

            /// Image Carousel
            TMyPostImageCarousel(screenWidth: screenWidth, imageUrls: imageUrls),

            SizedBox(width: screenWidth * 0.04), /// Spacing

            /// Description
            TMyPostDescription(title: title, user: user, screenWidth: screenWidth, screenHeight: screenHeight, status: status, statusColor: statusColor, chatId: chatId, userId: userId, buttonColor: buttonColor, buttonText: buttonText),
          ],
        ),
      ),
    );
  }
}