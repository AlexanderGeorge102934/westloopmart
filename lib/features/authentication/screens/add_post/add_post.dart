import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/helpers/helpers.dart';
import '../../../../common/widgets/posting/add_form.dart';
import '../../../../utils/constants/colors.dart';
import '../../controllers/add_post_offer/add_post_offer_controller.dart';
import '../../controllers/images/image_controller.dart';

/// Add Post Screen
class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});
  final ImageController _imageController = Get.put(ImageController());
  final PostingController _postingController = Get.put(PostingController());

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
      body: TAddForm(postingController: _postingController, imageController: _imageController),
    );
  }
}











