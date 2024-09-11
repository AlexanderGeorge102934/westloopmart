import 'package:flutter/material.dart';
import '../../../../features/authentication/controllers/add_post_offer/add_post_offer_controller.dart';
import '../../../../utils/constants/sizes.dart';

/// --- Description of Add Form --- ///
class TAddFormDescription extends StatelessWidget {
  const TAddFormDescription({
    super.key,
    required this.postingController,
  });

  final PostingController postingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: postingController.description,
      decoration: InputDecoration(
        hintText: "Description",
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: TSizes.fontSizeLg(context),
        ),
      ),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: TSizes.fontSizeLg(context),

      ),
      textCapitalization: TextCapitalization.characters,
      maxLines: null,
      minLines: 3, // Sets the initial height to show 3 lines
    );
  }
}