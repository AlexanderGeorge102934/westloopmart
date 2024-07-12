import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:startup_app/features/authentication/screens/add_offer/add_offer.dart';
import 'package:startup_app/helpers/helpers.dart';
import '../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../utils/constants/sizes.dart';
import '../utils/constants/texts.dart';
import 'offer.dart';


/// --- Widget of One Post --- ///
class TPost extends StatelessWidget {
  const TPost({
    super.key,
    required this.user,
    required this.description,
    required this.title,
    required this.imageUrls, required this.userPosition, required this.postPosition, required this.postID,
  });

  /// Details of the post
  final String user;
  final String description;
  final String title;
  final List<String> imageUrls;
  final Position userPosition;
  final GeoPoint postPosition;
  final String postID;

  /// Show offers related to the post
  void _showOffers(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: true,
          builder: (context, scrollController) {
            return StreamBuilder(
              stream: FirebaseFirestore.instance.collection('UserPosts').doc(postID).collection('Offers').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No comments'));
                }
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  controller: scrollController,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final offer = docs[index];
                    final imageUrls = List<String>.from(offer['ImageUrls']);
                    return TOffer(
                      title: offer['Title'],
                      postPosition: offer['Location'],
                      description: offer['Description'],
                      imageUrls: imageUrls,
                      user: offer['UserName'],
                      userPosition: userPosition,
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  /// Post Widget
  @override
  Widget build(BuildContext context) {
    final tag = UniqueKey().toString(); // TODO find best way to make unique keys
    final ImageCarouselController controller = Get.put(ImageCarouselController(), tag: tag);

    /// Calculate and format distance of user from post
    final distance = THelperFunctions.calculateDistance(userPosition.latitude, userPosition.longitude, postPosition.latitude, postPosition.longitude);
    final distanceString = THelperFunctions.formatDistance(distance);


    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image Carousel
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.md(context)),
              ),
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: imageUrls.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: imageUrls[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                  );
                },
              ),
            ),
          ),
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
          Center(child: SizedBox(width: THelperFunctions.screenWidth() * 0.7, child: ElevatedButton(onPressed: ()=> Get.to(()=> AddOfferScreen(postID: postID)), child: const Text(TTexts.offerPost)))),

          SizedBox(height: TSizes.spaceBtwItems(context)),

          /// See offers button
          Center(child: ElevatedButton(onPressed: () => _showOffers(context),child: const Text('Show Offers'))),

          SizedBox(height: TSizes.spaceBtwSections(context)),
        ],
      ),
    );
  }
}
