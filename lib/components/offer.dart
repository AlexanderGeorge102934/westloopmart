import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:startup_app/helpers/helpers.dart';

import '../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../utils/constants/sizes.dart';

class Offer extends StatelessWidget {
  const Offer({
    super.key,
    required this.user,
    required this.description,
    required this.title,
    required this.imageUrls, required this.userPosition, required this.postPosition,
  });

  final String user;
  final String description;
  final String title;
  final List<String> imageUrls;
  final Position userPosition;
  final GeoPoint postPosition;


  @override
  Widget build(BuildContext context) {

    final tag = UniqueKey().toString(); // Unique tag for each controller instance TODO find best way to make unique keys
    final ImageCarouselController controller = Get.put(ImageCarouselController(), tag: tag);
    final distance = THelperFunctions.calculateDistance(userPosition.latitude, userPosition.longitude, postPosition.latitude, postPosition.longitude);
    final distanceString = THelperFunctions.formatDistance(distance);/// todo check if this will change or not

    //user location and post location

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



          SizedBox(height: TSizes.spaceBtwSections(context)),
          // Obx(() {
          //   return Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: List.generate(
          //       imageUrls.length,
          //           (index) => buildIndicator(index == controller.currentPage.value),
          //     ),
          //   );
          // }),
        ],
      ),
    );
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 16.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
