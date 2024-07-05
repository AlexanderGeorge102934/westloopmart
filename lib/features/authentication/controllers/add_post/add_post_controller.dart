import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Add this import
import 'package:startup_app/data/repositories/initial_posts/initial_posts_repository.dart';
import 'package:startup_app/features/authentication/screens/home_screen/home_screen.dart';

import '../../../../helpers/network_manager.dart';
import '../../../../utils/ui/loader.dart';
import '../../../personalization/models/initial_post_model.dart';
import '../images/image_controller.dart';
import 'package:path/path.dart';


class PostController extends GetxController {
  static PostController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;


  final title = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  GlobalKey<FormState> postKey = GlobalKey<FormState>();

  // Add ImageController instance
  final ImageController imageController = Get.find<ImageController>();

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }


    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return await Geolocator.getCurrentPosition();
  }


  /// Todo make it so once you try opening the add button you're prompted to login or sign up
  Future<void> postOffer() async {
    final user = _auth.currentUser;
    if (user == null) {
      TLoader.errorSnackBar(title: "User not logged in", message: "Please log in to post an offer."); /// TODO redirect to login or sign up
      return;
    }

    try {
      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      /// Form Validation TODO actually make sure
      if (!postKey.currentState!.validate()) {
        debugPrint("Form is not valid");
        return;
      }

      /// Get image Urls
      List<String> imageUrls = await _uploadImages();

      final position = await determinePosition();


      /// Store in Firestore
      final post = InitialPostModel(
        userId: user.uid,
        userName: user.email ?? "Anonymous", /// TODO shouldn't have null
        title: title.text,
        description: description.text,
        category: category.text,
        imageUrls: imageUrls,
        timestamp: Timestamp.now(),
        location: GeoPoint(position.latitude, position.longitude),
      );


      /// Add initial post
      final initialPostsRepository = Get.put(InitialPostsRepository());
      await initialPostsRepository.addInitialPost(post);

      /// Clear everything from post controller
      title.clear();
      description.clear();
      category.clear();

    } catch (e) {
      TLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Get image urls to upload to Firebase
  Future<List<String>> _uploadImages() async {
    List<String> imageUrls = [];
    for (var image in imageController.images) {
      if (image != null) {
        try {
          String imageUrl = await _uploadImage(image);
          imageUrls.add(imageUrl);
        } catch (e) {
          debugPrint('Error uploading image: $e');
        }
      }
    }
    return imageUrls;
  }

  Future<String> _uploadImage(XFile image) async {
    try {
      final fileName = basename(image.path);
      final ref = _storage.ref().child('post_images/$fileName');
      final uploadTask = ref.putFile(File(image.path));
      final snapshot = await uploadTask.whenComplete(() => {});
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      debugPrint('Error uploading image: $e');
      rethrow;
    }
  }
}
