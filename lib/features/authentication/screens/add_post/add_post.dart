import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/helpers/helpers.dart';
import '../../../../utils/constants/colors.dart';
import '../../controllers/add_post/add_post_controller.dart';
import '../../controllers/images/image_controller.dart';
import 'Widgets/add_post_form.dart';


class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});
  final ImageController imageController = Get.put(ImageController());
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);



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
      body: TAddPostForm(postController: postController, imageController: imageController),
    );
  }
}











