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
    // debugPrint(postID);

    return Padding(
      padding: TSpacingStyle.paddingWithAppBarHeight(context) * 0.4,
      child: Form(
        key: postingController.postKey,
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: TSizes.spaceBtwItems(context)),
              /// Title
              TextFormField(
                controller: postingController.title,
                decoration: InputDecoration(
                  hintText: "Title", // This will show "Title" as the hint text
                  border: InputBorder.none, // Remove the border
                  enabledBorder: InputBorder.none, // Remove the border when enabled
                  focusedBorder: InputBorder.none, // Remove the border when focused
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TSizes.fontSizeXXXl(context), // Match this with your TextFormField's font size
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: TSizes.fontSizeXXXl(context), // Adjust the font size as needed

                ),
                textCapitalization: TextCapitalization.characters, // Capitalize text
              ),

              /// Image Grid
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.85, // Replace with the desired height
                child: TImageGrid(imageController: imageController),
              ),

              SizedBox(height: TSizes.spaceBtwItems(context)),

              /// Description
              TextFormField(
                controller: postingController.description,
                decoration: InputDecoration(
                  hintText: "Description", // This will show "Title" as the hint text
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TSizes.fontSizeLg(context), // Match this with your TextFormField's font size
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: TSizes.fontSizeLg(context), // Adjust the font size as needed

                ),
                textCapitalization: TextCapitalization.characters, // Capitalize text
                maxLines: null,
                minLines: 3, // Sets the initial height to show 5 lines
              ),
              SizedBox(height: TSizes.spaceBtwItems(context)),

              /// Category
              DropdownButtonFormField<String>(
                value: postingController.category.value.isEmpty
                    ? null
                    : postingController.category.value,
                decoration: InputDecoration(
                  hintText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TSizes.fontSizeLg(context),
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: TSizes.fontSizeLg(context),
                  color: Colors.black,
                ),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black), // Customize the dropdown icon
                iconSize: 24, // Adjust icon size if necessary
                isExpanded: true, // Ensures the dropdown field uses full width and aligns text properly
                alignment: Alignment.centerLeft, // Align the content to the left while ensuring the icon is aligned
                items: [
                  'Electronics',
                  'Furniture',
                  'Clothing',
                  'Personal Items',
                  'Services',
                  'Other',
                ].map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Align(
                      alignment: Alignment.centerLeft, // Align text to the left within the dropdown
                      child: Text(category),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  postingController.category.value = newValue!;
                },
              ),



              SizedBox(height: TSizes.spaceBtwItems(context)),

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
      ),
    );
  }
}