import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../../../utils/constants/sizes.dart';
import '../../offer/Widgets/image_carousel.dart';
import 'bottom_portion_of_post_layout.dart';
import 'header_of_post.dart';

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
          THeaderOfPost(user: user),

          /// Image Carousel
          TImageCarousel(controller: controller, imageUrls: imageUrls),

          SizedBox(height: TSizes.spaceBtwItems(context)),

          /// Bottom Portion of Post (Show Offers, Info of Post, Add Offer Button)
          TBottomPortionOfPostLayout(postID: postID, userPosition: userPosition, userId: userId, title: title, distanceString: distanceString, user: user),
        ],

    );
  }
}



