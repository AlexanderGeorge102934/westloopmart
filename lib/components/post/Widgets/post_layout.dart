import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import '../../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../../../features/authentication/screens/add_offer/add_offer.dart';
import '../../../features/authentication/screens/offers/offers_screen.dart';
import '../../../utils/constants/texts.dart';
import '../../offer/Widgets/image_carousel.dart';

class TPostLayout extends StatelessWidget {
  const TPostLayout({
    super.key,
    required this.controller,
    required this.imageUrls,
    required this.title,
    required this.user,
    required this.distanceString,
    required this.postID,
    required this.userPosition,
    required this.userId,
  });

  final ImageCarouselController controller;
  final List<String> imageUrls;
  final String title;
  final String user;
  final String distanceString;
  final String postID;
  final Position userPosition;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TImageCarousel(controller: controller, imageUrls: imageUrls),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    user,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    distanceString,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => AddOfferScreen(
                        postID: postID,
                        userOfPost: user,
                        titleOfPost: title,
                        userOfPostId: userId,
                      )),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      child: const Text(TTexts.offerPost),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => OffersScreen(
                        postID: postID,
                        userPosition: userPosition,
                        userId: userId,
                      )),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.greenAccent,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      child: const Text('Show Offers'),
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
