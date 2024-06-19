import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:startup_app/utils/ui/loader.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../helpers/network_manager.dart';

class LoginController extends GetxController {

  static LoginController get instance => Get.find();


  /// Variables
  final hidePassword = true.obs; // Observes to see if this changes
  final errorMessage = ''.obs; // Error message observable
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  void emailAndPasswordSignIn() async {
    try {

      // Reset the error message
      errorMessage.value = '';

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        debugPrint('No internet connection.');
        return;
      }
      debugPrint('Internet connection: $isConnected');

      // Form Validation
      if (loginFormKey.currentState == null) {
        debugPrint('FormState is null.');
        return;
      }
      debugPrint('FormState is not null.');

      if (!loginFormKey.currentState!.validate()) {
        debugPrint('Form validation failed.');
        return;
      }
      debugPrint('Form validation succeeded.');

      // Register user in the Firebase Authentication & Save user data in Firebase

      final userCredential = await AuthenticationRepository.instance.signInEmailPassword(email.text.trim(), password.text.trim(),);
      debugPrint('UserCredential: $userCredential');


      // Remove Loader TODO
      // Tfullscreenloader.stoploading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
      debugPrint('Screen redirect succeeded.');


    }
    catch (e) {
      // Tfullscreenloader.stoploading(); // Todo upload loading screen so we can remove it
      debugPrint('General error: $e');
      TLoader.errorSnackBar(title:'Oh Snap!', message: e);
    }
  }
}
