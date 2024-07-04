import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/helpers/helpers.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'Widgets/image_grid.dart';
import '../../controllers/add_post/add_post_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../controllers/camera/camera_controller.dart';
import '../../controllers/images/image_controller.dart';
import 'Widgets/add_post_form.dart';


class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});
  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final postController = Get.put(PostController());


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: dark ? TColors.white : TColors.black,
          icon: const Icon(Icons.close),
          onPressed: (){
            Get.back();
          },
        ),
      ),

      /// Adding Post Form
      body: AddPostForm(postController: postController, imageController: imageController),
    );
  }
}











