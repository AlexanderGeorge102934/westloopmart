import 'package:flutter/material.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../utils/constants/sizes.dart';

import '../../../features/authentication/controllers/add_post_offer/add_post_offer_controller.dart';
import '../../../features/authentication/controllers/images/image_controller.dart';
import 'image_grid.dart';

class TAddForm extends StatelessWidget {
  const TAddForm({
    super.key,

    required this.imageController, required this.postingController, this.postID, this.titleOfPost, this.userOfPost, this.userOfPostId
  });

  final PostingController postingController;
  final ImageController imageController;
  final String? postID;
  final String? titleOfPost;
  final String? userOfPost;
  final String? userOfPostId;

  @override
  Widget build(BuildContext context) {
    debugPrint(postID);

    return Padding(
      padding: TSpacingStyle.paddingWithAppBarHeight(context),
      child: Form(
        key: postingController.postKey,
        child: Column(

          children: [
            /// Title
            TextFormField(
              controller: postingController.title,
              decoration: const InputDecoration(labelText: "Title"),
            ),

            /// Image Grid
            Expanded(
              child: TImageGrid(imageController: imageController),
            ),

            /// Description
            TextFormField(
              controller: postingController.description,
              decoration: const InputDecoration(labelText: "Description"),
            ),

            /// Category
            TextFormField(
              controller: postingController.category,
              decoration: const InputDecoration(labelText: "Category"),
            ),

            /// Post offer button
            SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  if (postID == null) {
                    postingController.addPost();
                  } else if (postID != null && titleOfPost != null && userOfPost != null) {
                    postingController.addOffer(postID!, titleOfPost!, userOfPost!, userOfPostId!);
                  }
                }, child: postID == null ? const Text('Add Post') : const Text('Add Offer'))),
            SizedBox(height: TSizes.spaceBtwItems(context)),
          ],
        ),
      ),
    );
  }
}