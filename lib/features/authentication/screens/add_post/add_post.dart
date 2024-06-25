import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/styles/spacing_styles.dart';


class AddPostScreen extends StatelessWidget {
   AddPostScreen({super.key});
  final ImageController imageController = Get.put(ImageController());

  Widget _buildImageGrid() {
    return Obx(() {
      List<Widget> imageWidgets = [];

      for (int i = 0; i < imageController.images.length; i++) {
        imageWidgets.add(Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(File(imageController.images[i]!.path)),
              fit: BoxFit.cover,
            ),
          ),
        ));
      }

      if (imageController.images.length < 10) {
        imageWidgets.add(GestureDetector(
          onTap: imageController.pickImage,
          child: Container(
            color: Colors.grey[300],
            child: Center(
              child: Icon(Icons.add, size: 300, color: Colors.black54),

            ),
          ),
        ));
      }

      return Wrap(
        spacing: 10.0,
        runSpacing: 4.0,
        children: imageWidgets,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight(context),
        child: Column(

          children: [
            /// Title
            TextFormField(
              decoration: const InputDecoration(labelText: "Title"),
            ),

            /// Image Grid
            Expanded(
              child: SingleChildScrollView(
                child: _buildImageGrid(),
              ),
            ),


          ],


        ),
      ),
    );
  }
}



class ImageController extends GetxController {
  final images = <XFile?>[].obs;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    if (images.length < 10) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        images.add(image);
      }
    }
  }
}

