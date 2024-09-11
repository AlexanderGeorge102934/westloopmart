import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:startup_app/features/personalization/models/post_model.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';

/// --- Posts Repository --- ///
class PostsRepository extends GetxController {
  static PostsRepository get instance => Get.find();

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
