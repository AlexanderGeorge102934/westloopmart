import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// --- Shimmer for Posts --- ///
class TShimmerPosts extends StatelessWidget {
  const TShimmerPosts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final listPaddingVertical = screenHeight * 0.02;
    final avatarRadius = screenHeight * 0.03;
    final containerHeight = screenHeight * 0.015;


    return Expanded(
      child: ListView.builder(
        itemCount: 5, // Number of shimmer placeholders for posts
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: listPaddingVertical,
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Container(
                        width: screenWidth * 0.3,
                        height: containerHeight * 1.6, // Height scaled dynamically
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    height: screenHeight * 0.3,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    width: screenWidth * 0.4,
                    height: containerHeight * 1.6,
                    color: Colors.white,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    width: screenWidth * 0.2,
                    height: containerHeight,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

