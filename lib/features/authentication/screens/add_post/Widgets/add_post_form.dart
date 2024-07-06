import 'package:flutter/material.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../utils/constants/sizes.dart';
import 'image_grid.dart';
import '../../../controllers/add_post/add_post_controller.dart';
import '../../../controllers/images/image_controller.dart';

class TAddPostForm extends StatelessWidget {
  const TAddPostForm({
    super.key,
    required this.postController,
    required this.imageController,
  });

  final PostController postController;
  final ImageController imageController;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: TSpacingStyle.paddingWithAppBarHeight(context),
      child: Form(
        key: postController.postKey,
        child: Column(

          children: [
            /// Title
            TextFormField(
              controller: postController.title,
              decoration: const InputDecoration(labelText: "Title"),
            ),

            /// Image Grid
            Expanded(
              child: TImageGrid(imageController: imageController),
            ),

            /// Description
            TextFormField(
              controller: postController.description,
              decoration: const InputDecoration(labelText: "Description"),
            ),

            /// Category
            TextFormField(
              controller: postController.category,
              decoration: const InputDecoration(labelText: "Category"),
            ),

            /// Post offer button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> postController.postOffer(), child: const Text('Post Offer'))),
            SizedBox(height: TSizes.spaceBtwItems(context)),
          ],
        ),
      ),
    );
  }
}