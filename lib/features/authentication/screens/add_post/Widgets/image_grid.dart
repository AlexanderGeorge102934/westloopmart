import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/images/image_controller.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key, required this.imageController});

  final ImageController imageController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Widget> imageWidgets = [];

      // Add the "add image" icon first
      imageWidgets.add(GestureDetector(
        onTap: () => _showPickImageModal(context, imageController),
        child: Container(
          width: 100, // TODo make dynamic
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
              // be able to edit when you tap one of the images
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

  void _showPickImageModal(BuildContext context, ImageController imageController) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    child: const Column(
                      children: [
                        Icon(Icons.image, size: 60.0),
                        SizedBox(height: 12.0),
                        Text(
                          "Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    onTap: () {
                      imageController.imgFromGallery();
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: const Column(
                      children: [
                        Icon(Icons.camera_alt, size: 60.0),
                        SizedBox(height: 12.0),
                        Text(
                          "Camera",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    onTap: () {
                      imageController.imgFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
