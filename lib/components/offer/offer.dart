import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:startup_app/helpers/helpers.dart';

import '../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/texts.dart';
import 'Widgets/engagement_bar.dart';
import 'Widgets/engagment_bar_for_owner.dart';
import 'Widgets/image_carousel.dart';

/// --- Widget of One Offer --- ///
class TOffer extends StatelessWidget {
  const TOffer({
    super.key,
    required this.user,
    required this.description,
    required this.title,
    required this.imageUrls, required this.userPosition, required this.postPosition, required this.userIdOfOffer, required this.ownerOfPost,
  });

  final String user;
  final String description;
  final String title;
  final List<String> imageUrls;
  final Position userPosition;
  final GeoPoint postPosition;
  final String userIdOfOffer;
  final bool ownerOfPost;


  @override
  Widget build(BuildContext context) {
    final tag = UniqueKey().toString(); // TODO find best way to make unique keys
    final ImageCarouselController controller = Get.put(ImageCarouselController(), tag: tag);

    /// Calculate and format distance of user from post
    final distance = THelperFunctions.calculateDistance(userPosition.latitude, userPosition.longitude, postPosition.latitude, postPosition.longitude);
    final distanceString = THelperFunctions.formatDistance(distance);

    //user location and post location

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image Carousel
          TImageCarousel(controller: controller, imageUrls: imageUrls),

          SizedBox(height: TSizes.spaceBtwItems(context)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            /// Title, User, Distance, and option buttons to accept or decline offer, but ONLY if user is owner of post
            child: ownerOfPost
                ? TEngagmentBarForOwner(title: title, user: user, distanceString: distanceString)
                : TEngagementBar(title: title, user: user, distanceString: distanceString),

          ),




          SizedBox(height: TSizes.spaceBtwSections(context)),
        ],
      ),
    );
  }
}





