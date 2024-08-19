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
import 'Widgets/offer_layout.dart';

/// --- Widget of One Offer --- ///
class TOffer extends StatelessWidget {
  const TOffer({
    super.key,
    required this.user,
    required this.description,
    required this.title,
    required this.imageUrls,
    required this.userPosition,
    required this.postPosition,
    required this.userIdOfOffer,
    required this.ownerOfPost,
    required this.statusOfOffer,
    required this.offerId,
    required this.postId,
    required this.userId,
  });

  /// General Components
  final String user;
  final String description;
  final String title;
  final List<String> imageUrls;
  final String statusOfOffer;

  /// Location Components
  final Position userPosition;
  final GeoPoint postPosition;

  /// Backend Components
  final String userIdOfOffer;
  final bool ownerOfPost; // Are they allowed to accept or deny offer?
  final String offerId;
  final String postId;
  final String userId;


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
      child: TOfferLayout(controller: controller, imageUrls: imageUrls, ownerOfPost: ownerOfPost, title: title, user: user, distanceString: distanceString, postId: postId, offerId: offerId, userIdOfOffer: userIdOfOffer, userId: userId,),
    );
  }
}







