import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../../utils/constants/sizes.dart';
import '../offer/Widgets/image_carousel.dart';

class TTrades extends StatelessWidget {
  const TTrades({super.key, required this.titleOfOffer, required this.imageUrls, required this.statusOfOffer, required titleOfPost, required userOfPost});

  // final String userOfPost;
  // final String titleOfPost;
  final String titleOfOffer;
  final List<String> imageUrls;
  final String statusOfOffer;


  @override
  Widget build(BuildContext context) {
    final tag = UniqueKey().toString(); // TODO find best way to make unique keys
    final ImageCarouselController controller = Get.put(ImageCarouselController(), tag: tag); //TODO change image carousel location and also post's image carousel


    return Padding(
      padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems(context)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Row(
          children: [
            /// Image Carousel
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(TSizes.md(context)),
                ),
                width: 10,
                height: MediaQuery.of(context).size.height * 0.3,
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: imageUrls.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: imageUrls[index],
                      fit: BoxFit.cover,
                      // width: double.infinity,
                      // height: MediaQuery.of(context).size.height * 0.004,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                    );
                  },
                ),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(

                children: [

                  // Text("$titleOfPost by $userOfPost"),

                  Text("You offered a $titleOfOffer"),

                  Text(statusOfOffer)
                ],

              ),
            )

          ],
        ),
      ),
    );
  }
}
