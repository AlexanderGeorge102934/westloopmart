import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// --- Image Carousel of Trade --- ///
class TImageCarouselOfTrade extends StatelessWidget {
  const TImageCarouselOfTrade({
    super.key,
    required this.screenWidth,
    required this.imageUrls,
  });

  final double screenWidth;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AspectRatio(
        aspectRatio: 2 / 3, // Maintain a consistent aspect ratio
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
            child: PageView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: imageUrls[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}