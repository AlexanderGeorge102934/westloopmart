import 'package:flutter/material.dart';
import '../../../../features/authentication/controllers/add_post_offer/add_post_offer_controller.dart';

/// --- Add Button of Add Form --- ///
class TAddButton extends StatelessWidget {
  const TAddButton({
    super.key,
    required this.postID,
    required this.postingController,
    required this.titleOfPost,
    required this.userOfPost,
    required this.userOfPostId,
  });

  final String? postID;
  final PostingController postingController;
  final String? titleOfPost;
  final String? userOfPost;
  final String? userOfPostId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
        child: ElevatedButton(onPressed: () {
          if (postID == null) {
            postingController.addPost();
          } else if (postID != null && titleOfPost != null && userOfPost != null) {
            postingController.addOffer(postID!, titleOfPost!, userOfPost!, userOfPostId!);
          }
        }, child: postID == null ? const Text('Add Post') : const Text('Add Offer')));
  }
}