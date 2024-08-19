import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../features/authentication/controllers/add_post_offer/add_post_offer_controller.dart';

class TEngagmentBarForOwner extends StatelessWidget {
  const TEngagmentBarForOwner({
    super.key,
    required this.title,
    required this.user,
    required this.distanceString, required this.postId, required this.offerId, required this.userIdOfOffer, required this.userIdOfPost,
  });

  final String title;
  final String user;
  final String distanceString;
  final String postId;
  final String offerId;
  final String userIdOfOffer;
  final String userIdOfPost;



  @override
  Widget build(BuildContext context) {
    final PostingController postingController = Get.put(PostingController());
    return Row(

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              /// Name
              Text(user,
                style: Theme.of(context).textTheme.bodySmall,
              ),

              /// Distance
              Text(distanceString,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const Spacer(),

          /// Accept or deny offer button
          Row(
            children: [
              /// Todo make spacing dynamic
              CircleAvatar(radius: 30,child: IconButton(onPressed: () => postingController.denyOffer(postId, offerId, userIdOfOffer), icon: const Icon(Icons.close)),),
              const SizedBox(width: 8.0),
              CircleAvatar(radius: 30,child: IconButton(onPressed: () => postingController.acceptOffer(postId, offerId, userIdOfOffer, userIdOfPost), icon: const Icon(Icons.check)))
            ],
          )
        ],
    );
  }
}
