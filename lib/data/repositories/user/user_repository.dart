import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/personalization/models/user_model.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';

/// --- User Repository --- ///
class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  /// Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try{
      return await _db.collection("Users").doc(user.id).set(user.toJson());
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

  /// Get current user
  Future<User?> getCurrentUser() async {
    try {
      return FirebaseAuth.instance.currentUser;
    }
    catch (e) {
      throw 'Error retrieving current user: $e';
    }

  }

  /// Get current user as UserModel
  Future<UserModel?> getCurrentUserModel() async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) {
        throw 'No user is currently logged in.';
      }

      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser.uid).get();
      if (snapshot.exists) {
        return UserModel.fromSnapshot(snapshot);
      } else {
        throw 'User record not found.';
      }
    } catch (e) {
      throw 'Error retrieving user: $e';
    }
  }


}