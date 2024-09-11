import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../features/authentication/controllers/image_carousel/image_carousel_controller.dart';
import '../../../utils/constants/sizes.dart';

/// --- Image Carousel of Offer --- ///
class TImageCarousel extends StatelessWidget {
  const TImageCarousel({
    super.key,
    required this.controller,
    required this.imageUrls,
  });

  final ImageCarouselController controller;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}