import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/features/authentication/screens/chat/chat_screen.dart';
import 'package:startup_app/utils/constants/sizes.dart';
import '../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../../features/authentication/controllers/messages/messages_controller.dart';
import 'Widgets/description.dart';
import 'Widgets/image_carousel.dart';


/// --- Trades --- ///
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
            TImageCarouselOfTrade(screenWidth: screenWidth, imageUrls: imageUrls),

            SizedBox(width: screenWidth * 0.04), /// Spacing

            /// Description
            TDescriptionOfTrade(titleOfPost: titleOfPost, userOfPost: userOfPost, screenHeight: screenHeight, titleOfOffer: titleOfOffer, screenWidth: screenWidth, statusOfOffer: statusOfOffer, statusColor: statusColor, chatId: chatId, userId1: userId1, userId2: userId2, offerId: offerId, postId: postId, buttonColor: buttonColor, buttonText: buttonText),
          ],
        ),
      ),
    );
  }
}

