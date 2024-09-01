import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';

import '../../../features/authentication/screens/add_offer/add_offer_screen.dart';
import '../../../features/authentication/screens/offers/offers_screen.dart';
import '../../../utils/constants/sizes.dart';
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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Circle Avatar and User Name
          Padding(
            padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems(context), horizontal: TSizes.spaceBtwItems(context) ),
            child: Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 10),
                Text(
                  user,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          /// Image Carousel
          TImageCarousel(controller: controller, imageUrls: imageUrls),
          SizedBox(height: TSizes.spaceBtwItems(context)),


          Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems(context)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Center the content vertically
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() => OffersScreen(
                          postID: postID,
                          userPosition: userPosition,
                          userId: userId,
                        )),
                        child: Text(
                          'Show Offers',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.blueAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
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
                Align(
                  alignment: Alignment.center,  // Center the button vertically
                  child: ClipOval(
                    child: SizedBox(
                      width: 55.0,  // Custom width
                      height: 55.0, // Custom height
                      child: FloatingActionButton(
                        onPressed: () => Get.to(() => AddOfferScreen(
                          postID: postID,
                          userOfPost: user,
                          titleOfPost: title,
                          userOfPostId: userId,
                        )),
                        backgroundColor: Colors.blueAccent,
                        child: const Icon(Icons.add, color: Colors.white),
                        heroTag: null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

    );
  }
}
