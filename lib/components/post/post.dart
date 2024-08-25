import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:startup_app/features/authentication/screens/add_offer/add_offer.dart';
import 'package:startup_app/features/authentication/screens/offers/offers_screen.dart';
import 'package:startup_app/helpers/helpers.dart';
import '../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/texts.dart';
import '../offer/Widgets/image_carousel.dart';
import 'Widgets/post_layout.dart';


/// --- Widget of One Post --- ///
class TPost extends StatelessWidget {
  const TPost({
    super.key,
    required this.user,
    required this.description,
    required this.title,
    required this.imageUrls,
    required this.userPosition,
    required this.postPosition,
    required this.postID,
    required this.userId,
  });

  /// Details of the post
  final String user;
  final String description;
  final String title;
  final List<String> imageUrls;
  final Position userPosition;
  final GeoPoint postPosition;
  final String postID;
  final String userId;

  /// Post Widget
  @override
  Widget build(BuildContext context) {
    final tag = UniqueKey().toString(); // TODO find best way to make unique keys
    final ImageCarouselController controller = Get.put(ImageCarouselController(), tag: tag);

    /// Calculate and format distance of user from post (Not sure if this would be good to put inside or outside the build)
    final distance = THelperFunctions.calculateDistance(userPosition.latitude, userPosition.longitude, postPosition.latitude, postPosition.longitude);
    final distanceString = THelperFunctions.formatDistance(distance);


    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: TPostLayout(controller: controller, imageUrls: imageUrls, title: title, user: user, distanceString: distanceString, postID: postID, userPosition: userPosition, userId: userId),
    );
  }
}




