import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:startup_app/features/personalization/models/post_model.dart';

import '../../../features/personalization/models/user_model.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';

class PostsRepository extends GetxController {
  static PostsRepository get instance => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<String>> uploadImages(List<XFile> images, String userId) async {
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
        final metadata = await snapshot.ref.getMetadata();
        final imageUrl = await snapshot.ref.getDownloadURL();
        imageUrls.add(imageUrl);
      } catch (e) {
        throw 'Error uploading image: $e';
      }
    }
    return imageUrls;
  }

  /// Determine user's current position
  Future<Position?> determinePosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw 'Location services are disabled.';
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied.';
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw 'Location permissions are permanently denied.';
      }

      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      throw 'Error determining position: $e';
    }
  }


  /// Function to save user data to Firestore
  Future<void> addPost(PostModel post, String userId) async {
    try{
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentReference postRef = await FirebaseFirestore.instance.collection("UserPosts").add(post.toJson());
        String postId = postRef.id;
        await FirebaseFirestore.instance.collection("Users").doc(userId).collection("Posts").doc(postId).set({"PostId": postId});
      });


    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message; //TODO make sure all messages are checked and good (Didn't take time checking)
    } on FormatException catch (_){
      throw const TFormatException(); //TODO make sure all messages are checked and good (Didn't take time checking)
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; //TODO make sure all messages are checked and good (Didn't take time checking)
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to retrieve post from Firestore
  Future<DocumentSnapshot> retrievePost(String postId) async {
    try{
      return await FirebaseFirestore.instance.collection("UserPosts").doc(postId).get();
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message; //TODO make sure all messages are checked and good (Didn't take time checking)
    } on FormatException catch (_){
      throw const TFormatException(); //TODO make sure all messages are checked and good (Didn't take time checking)
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; //TODO make sure all messages are checked and good (Didn't take time checking)
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// Function to update offer in Firestore
  Future<void> updatePost(String postId, String status) async {

    try{

      await FirebaseFirestore.instance.collection("UserPosts").doc(postId).update({'Status': status});
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message; //TODO make sure all messages are checked and good (Didn't take time checking)
    } on FormatException catch (_){
      throw const TFormatException(); //TODO make sure all messages are checked and good (Didn't take time checking)
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; //TODO make sure all messages are checked and good (Didn't take time checking)
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
