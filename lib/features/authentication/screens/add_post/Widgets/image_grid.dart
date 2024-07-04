import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/add_post/add_post_controller.dart';
import '../../../controllers/images/image_controller.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({
    super.key,
    required this.imageController,
  });

  final ImageController imageController;




  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Widget> imageWidgets = [];

      // Add the "add image" icon first
      imageWidgets.add(GestureDetector(
        onTap: () {
          if (context.mounted) {
            imageController.pickImage(context);
          }
        },
        child: Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(4.0),
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.add, size: 50, color: Colors.black54),
          ),
        ),
      ));

      // Add the existing images
      for (int i = 0; i < imageController.images.length; i++) {
        if (imageController.images[i] != null) {
          imageWidgets.add(GestureDetector(
            onTap: () {
              // Implement your onTap functionality here
            },
            child: Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(imageController.images[i]!.path)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ));
        }
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: imageWidgets,
        ),
      );
    });
  }
}
