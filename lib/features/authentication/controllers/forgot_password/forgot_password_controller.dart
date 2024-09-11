import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:startup_app/data/repositories/authentication/authentication_repository.dart';
import 'package:startup_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:startup_app/helpers/network_manager.dart';
import 'package:startup_app/utils/ui/loader.dart';

/// --- Forgot Password Controller --- ///
class ForgotPasswordController extends GetxController{
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      /// Todo show a loader (Like Airbnb)
      /// 8:30 Flutter Forget Password with firebase


      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        debugPrint('No internet connection.');
        return;
      }

      /// Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        debugPrint('Incorrect Form Validation.');
        return;
      }

      /// Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Todo show success screen loader snack bar

      Get.to(()=> ResetPasswordScreen(email: email.text.trim()));


    } catch (e) {
        TLoader.errorSnackBar(title: 'Oh Snap');
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      /// Todo show a loader (Like Airbnb)
      /// 8:30 Flutter Forget Password with firebase


      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        debugPrint('No internet connection.');
        return;
      }

      /// Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Todo show success screen loader snack bar


    } catch (e) {
        TLoader.errorSnackBar(title: 'Oh Snap');
    }
  }






}