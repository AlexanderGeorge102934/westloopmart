import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../helpers/network_manager.dart';
import '../../../../utils/ui/loader.dart';

class PostController extends GetxController{
  static PostController get instance => Get.find();
  final _auth = FirebaseAuth.instance; /// TODO not sure if this is the best practice for getting current user. Might need to use local storage class


  final title = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  /// Might need location,
  GlobalKey<FormState> postKey = GlobalKey<FormState>();

  void postOffer() async{
    final user = _auth.currentUser;
    try{
      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      /// Form Validation
      if (!postKey.currentState!.validate()) {
        debugPrint("Form is not valid");
        return;
      }

      /// Store in fireabse
      FirebaseFirestore.instance.collection("User Posts").add({
        'UserName': user?.email, ///TODO Need to make a User class to fetch their data, simply calling user is not a string it's complex list of letters
        'Title': title.text,
        'Description': description.text,
        'Category': category.text,
        'TimeStamp': Timestamp.now(),
      });


    }
    catch (e){
      TLoader.errorSnackBar(title: "Oh Snap!", message: e.toString()); // TODO get rid of context on snack bars and also
    }finally{

    }
  }


}