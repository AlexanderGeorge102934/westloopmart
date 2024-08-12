import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../../../features/authentication/screens/add_offer/add_offer.dart';
import '../../../features/authentication/screens/offers/offers_screen.dart';
import '../../../helpers/helpers.dart';
import '../../../utils/constants/sizes.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Image Carousel
        TImageCarousel(controller: controller, imageUrls: imageUrls),
        SizedBox(height: TSizes.spaceBtwItems(context)),

        /// Title
        Text(title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),

        ///Name
        Text(user,
          style: Theme.of(context).textTheme.bodySmall,
        ),

        /// distance
        Text(distanceString,
          style: Theme.of(context).textTheme.bodySmall,
        ),

        /// Add offer button
        Center(child: SizedBox(width: THelperFunctions.screenWidth() * 0.7, child: ElevatedButton(onPressed: ()=> Get.to(()=> AddOfferScreen(postID: postID, userOfPost: user, titleOfPost: title, userOfPostId: userId)), child: const Text(TTexts.offerPost)))),
        SizedBox(height: TSizes.spaceBtwItems(context)),

        /// See offers button
        Center(child: ElevatedButton(onPressed: ()=> Get.to(()=>OffersScreen(postID: postID, userPosition: userPosition, userId: userId)),child: const Text('Show Offers'))),
        SizedBox(height: TSizes.spaceBtwSections(context)),
      ],
    );
  }
}