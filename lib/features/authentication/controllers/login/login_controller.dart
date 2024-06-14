import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:startup_app/utils/ui/loader.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../helpers/network_manager.dart';

class LoginController extends GetxController{

  ///Variables
  final hidePassword = true.obs; // Observes to see if this changes
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void emailAndPasswordSignIn (BuildContext context) async {

    try {

      /// TODO Redirect to main page and make it splash screen like YT


      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      /// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        loginFormKey.currentState!.save();
        return;
      }

      /// Register user in the Firebase Authentication & Save user data in Firebase
      final userCredential = await AuthenticationRepository.instance.signInEmailPassword(email.text.trim(), password.text.trim());

      /// Remove Loader TODO
      // Tfullscreenloader.stoploading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e){
      // Tfullscreenloader.stoploading();
      if (context.mounted) {
        TLoader.errorSnackBar(context: context, title: 'Something went wrong');
      }

    }
  }

}