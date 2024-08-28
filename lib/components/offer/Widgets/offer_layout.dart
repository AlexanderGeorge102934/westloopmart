import 'package:flutter/cupertino.dart';

import '../../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../../../utils/constants/sizes.dart';
import '../../post/Widgets/image_carousel.dart';
import 'engagement_bar.dart';
import 'engagment_bar_for_owner.dart';

class TOfferLayout extends StatelessWidget {
  const TOfferLayout({
    super.key,
    required this.controller,
    required this.imageUrls,
    required this.ownerOfPost,
    required this.title,
    required this.user,
    required this.distanceString,
    required this.postId,
    required this.offerId,
    required this.userIdOfOffer, required this.userId, required this.statusOfOffer,
  });

  final ImageCarouselController controller;
  final List<String> imageUrls;
  final bool ownerOfPost;
  final String title;
  final String user;
  final String distanceString;
  final String postId;
  final String offerId;
  final String userIdOfOffer;
  final String userId;
  final String statusOfOffer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Image Carousel
        TImageCarousel(controller: controller, imageUrls: imageUrls),

        SizedBox(height: TSizes.spaceBtwItems(context)),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          /// Title, User, Distance, and option buttons to accept or decline offer, but ONLY if user is owner of post
          child: ownerOfPost
              ? TEngagementBarForOwner(title: title, user: user, distanceString: distanceString, postId: postId, offerId: offerId, userIdOfOffer: userIdOfOffer, userIdOfPost: userId, statusOfOffer: statusOfOffer,)
              : TEngagementBar(title: title, user: user, distanceString: distanceString),

        ),


        SizedBox(height: TSizes.spaceBtwSections(context)),
      ],
    );
  }
}