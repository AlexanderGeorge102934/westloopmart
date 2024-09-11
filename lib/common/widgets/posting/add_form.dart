import 'package:flutter/material.dart';
import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../features/authentication/controllers/add_post_offer/add_post_offer_controller.dart';
import '../../../features/authentication/controllers/images/image_controller.dart';
import 'Widgets/description.dart';
import 'Widgets/image_grid.dart';
import 'Widgets/add_button.dart';
import 'Widgets/drop_down_menu.dart';
import 'Widgets/title.dart';

/// Form to Add a Post/Offer
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
    // debugPrint(postID);

    return Padding(
      padding: TSpacingStyle.paddingWithAppBarHeight(context) * 0.4,
      child: Form(
        key: postingController.postKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: TSizes.spaceBtwItems(context)), /// Spacing

              /// Title
              TAddFormTitle(postingController: postingController),

              /// Image Grid
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.85, // Replace with the desired height
                child: TImageGrid(imageController: imageController),
              ),

              SizedBox(height: TSizes.spaceBtwItems(context)), /// Spacing

              /// Description
              TAddFormDescription(postingController: postingController),

              SizedBox(height: TSizes.spaceBtwItems(context)), /// Spacing

              /// Category
              TAddFormDropDownMenu(postingController: postingController),

              SizedBox(height: TSizes.spaceBtwItems(context)), /// Spacing

              /// Post offer button
              TAddButton(postID: postID, postingController: postingController, titleOfPost: titleOfPost, userOfPost: userOfPost, userOfPostId: userOfPostId),

              SizedBox(height: TSizes.spaceBtwItems(context)), /// Spacing
            ],
          ),
        ),
      ),
    );
  }
}

