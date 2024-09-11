import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../features/authentication/controllers/add_post_offer/add_post_offer_controller.dart';
import '../../../../utils/constants/sizes.dart';

/// --- Title of Add Form --- ///
class TAddFormTitle extends StatelessWidget {
  const TAddFormTitle({
    super.key,
    required this.postingController,
  });

  final PostingController postingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: postingController.title,
      decoration: InputDecoration(
        hintText: "Title",
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: TSizes.fontSizeXXXl(context),
        ),
      ),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: TSizes.fontSizeXXXl(context), // Adjust the font size as needed

      ),
      textCapitalization: TextCapitalization.characters, // Capitalize text
    );
  }
}