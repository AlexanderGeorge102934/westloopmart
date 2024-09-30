import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/constants/sizes.dart';

/// --- Shimmer for Category List --- ///
class TShimmerCategoryList extends StatelessWidget {
  const TShimmerCategoryList({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final iconSize = screenHeight * 0.05;
    final containerHeight = screenHeight * 0.015;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: TSizes.spaceBtwItems(context),
      ),
      child: SizedBox(
        height: screenHeight * 0.1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6, // Number of shimmer placeholders for categories
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: iconSize * 2, // Dynamic width based on icon size
                      height: containerHeight,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}