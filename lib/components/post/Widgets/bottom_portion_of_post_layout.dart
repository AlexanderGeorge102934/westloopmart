import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../features/authentication/screens/add_offer/add_offer_screen.dart';
import '../../../features/authentication/screens/offers/offers_screen.dart';
import '../../../utils/constants/sizes.dart';

/// --- Bottom Portion of Post --- ///
class TBottomPortionOfPostLayout extends StatelessWidget {
  const TBottomPortionOfPostLayout({
    super.key,
    required this.postID,
    required this.userPosition,
    required this.userId,
    required this.title,
    required this.distanceString,
    required this.user,
  });

  final String postID;
  final Position userPosition;
  final String userId;
  final String title;
  final String distanceString;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.005),
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
                      fontSize: TSizes.fontSizeMd(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: TSizes.fontSizeLg(context),
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
                width: MediaQuery.of(context).size.width * 0.15,  // Width is 15% of screen width
                height: MediaQuery.of(context).size.height * 0.07, // Custom height
                child: FloatingActionButton(
                  onPressed: () => Get.to(() => AddOfferScreen(
                    postID: postID,
                    userOfPost: user,
                    titleOfPost: title,
                    userOfPostId: userId,
                  )),
                  backgroundColor: Colors.blueAccent,
                  heroTag: null,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
