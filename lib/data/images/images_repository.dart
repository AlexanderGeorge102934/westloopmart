import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

/// --- Images Repository --- ///
class ImagesRepository extends GetxController{
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Upload Post Images
  Future<List<String>> uploadPostImages(List<XFile> images, String userId) async {
    List<String> imageUrls = [];
    for (var image in images) {
      try {
        final fileName = basename(image.path);
        final ref = _storage.ref().child('post_images/$userId/$fileName');
        final uploadTask = ref.putFile(
          File(image.path),
          SettableMetadata(customMetadata: {'UserId': userId}),
        );
        final snapshot = await uploadTask.whenComplete(() => {});
        // final metadata = await snapshot.ref.getMetadata();
        final imageUrl = await snapshot.ref.getDownloadURL();
        imageUrls.add(imageUrl);
      } catch (e) {
        throw 'Error uploading image: $e';
      }
    }
    return imageUrls;
  }

  /// Upload Offers Images
  Future<List<String>> uploadOfferImages(List<XFile> images, String userId, String postId) async {
    List<String> imageUrls = [];
    for (var image in images) {
      try {
        final fileName = basename(image.path);
        final ref = _storage.ref().child('offers_images/$userId/$postId/$fileName');
        final uploadTask = ref.putFile(
          File(image.path),
          SettableMetadata(customMetadata: {'UserId': userId, 'PostId': postId}),
        );
        final snapshot = await uploadTask.whenComplete(() => {});
        final imageUrl = await snapshot.ref.getDownloadURL();
        imageUrls.add(imageUrl);
      } catch (e) {
        throw 'Error uploading image: $e'; // Rethrow the original error
      }
    }
    return imageUrls;
  }

}