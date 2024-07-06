import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:startup_app/data/repositories/initial_posts/initial_posts_repository.dart';
import 'package:startup_app/utils/ui/loader.dart';
import '../../../../helpers/network_manager.dart';
import '../../../personalization/models/post_model.dart';
import '../images/image_controller.dart';

class PostController extends GetxController {
  static PostController get instance => Get.find();
  final PostsRepository _postsRepository = PostsRepository();

  final title = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  GlobalKey<FormState> postKey = GlobalKey<FormState>();

  final ImageController imageController = Get.find<ImageController>();

  /// Post offer
  Future<void> postOffer() async {
    final user = await _postsRepository.getCurrentUser();
    if (user == null) {
      TLoader.errorSnackBar(title: "User not logged in", message: "Please log in to post an offer."); // todo change it so once you click the add button you immediantly go to the login
      return;
    }

    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoader.errorSnackBar(title: "No Internet", message: "Please check your internet connection.");
        return;
      }

      if (postKey.currentState == null || !postKey.currentState!.validate()) {
        debugPrint("Form is not valid");
        TLoader.errorSnackBar(title: "Validation Error", message: "Please fill out all fields correctly.");
        return;
      }

      /// Convert RxList<XFile?> to List<XFile>
      List<XFile> images = imageController.images.where((image) => image != null).cast<XFile>().toList();

      /// Get image urls
      List<String> imageUrls = await _postsRepository.uploadImages(images);

      /// Get user's position
      final position = await _postsRepository.determinePosition();
      if (position == null) return; // Don't post unless they give their position

      final post = PostModel(
        userId: user.uid,
        userName: user.email ?? "Anonymous", // todo figure out how to get rid of anonymous
        title: title.text,
        description: description.text,
        category: category.text,
        imageUrls: imageUrls,
        timestamp: Timestamp.now(),
        location: GeoPoint(position.latitude, position.longitude),
      );

      await _postsRepository.addPost(post);

      title.clear();
      description.clear();
      category.clear();
    } catch (e) {
      TLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}

