import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/helpers/helpers.dart';
import '../../../../common/widgets/posting/add_form.dart';
import '../../../../utils/constants/colors.dart';
import '../../controllers/add_post_offer/add_post_offer_controller.dart';
import '../../controllers/images/image_controller.dart';

/// Add Offer Screen
class AddOfferScreen extends StatelessWidget {
  AddOfferScreen({
    super.key,
    required this.postID,
    required this.titleOfPost,
    required this.userOfPost,
    required this.userOfPostId,
  });

  final ImageController _imageController = Get.put(ImageController());
  final PostingController _postingController = Get.put(PostingController());
  final String postID;
  final String titleOfPost;
  final String userOfPost;
  final String userOfPostId;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return WillPopScope(
      onWillPop: () async {
        // Clear the form when the user navigates back
        _postingController.clearForm();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: dark ? TColors.white : TColors.black,
            icon: const Icon(Icons.close),
            onPressed: () {
              _postingController.clearForm(); // Ensure clearing when the close button is pressed
              Get.back();
            },
          ),
          title: const Text('Add Offer'),
          centerTitle: true,
        ),
        body: TAddForm(
          postingController: _postingController,
          imageController: _imageController,
          postID: postID,
          titleOfPost: titleOfPost,
          userOfPost: userOfPost,
          userOfPostId: userOfPostId,
        ),
      ),
    );
  }
}





