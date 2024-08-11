import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/features/authentication/screens/chat/chat_screen.dart';

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
  });

  final String userOfPost;
  final String titleOfPost;
  final String titleOfOffer;
  final List<String> imageUrls;
  final String statusOfOffer;

  @override
  Widget build(BuildContext context) {
    final tag = UniqueKey().toString(); // TODO find best way to make unique keys
    final ImageCarouselController controller = Get.put(ImageCarouselController(), tag: tag); //TODO change image carousel location and also post's image carousel

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: SizedBox(
        height: screenHeight * 0.23,  // Adjusted height to accommodate the button
        child: Row(
          children: [
            /// Image Carousel
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
                    "$titleOfPost by $userOfPost",
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "You offered a $titleOfOffer",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    statusOfOffer,
                    style: TextStyle(
                      color: statusOfOffer == 'Accepted'
                          ? Colors.green
                          : statusOfOffer == 'Offered'
                          ? Colors.yellow
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),  // Add some space before the button

                  // Conditional rendering of the button
                  if (statusOfOffer == 'Accepted')
                    ElevatedButton(
                      onPressed: () async {
                        final MessagesController messagesController = Get.put(MessagesController());
                        /// TOdo get user id's from trade
                        // await messagesController.createChat(userId1, userId2); // Todo make create chat a seperate function
                        //
                        // // Add your button functionality here
                        // Get.to(()=>ChatScreen(chatId: chatId, userId: userId, otherUserId: '',))
                      },
                      child: Text('Send Message'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blue,  // Text color
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
