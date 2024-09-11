import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:startup_app/data/repositories/user/user_repository.dart';
import 'package:startup_app/utils/ui/loader.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../helpers/network_manager.dart';
import '../../../personalization/models/user_model.dart';
import '../../screens/home_screen/home_screen.dart';

/// --- Create Account Controller --- ///
class CreateAccountController extends GetxController{
  static CreateAccountController get instance => Get.find(); //Saves memory when creating instances

  /// Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final checkBox = false.obs; // Observable to see if user checked box and agreed to terms and conditions
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Create Account
  void createAccount() async{
    try{

      // TODO load splash screen

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;
      
      
      /// Form Validation
      if (!signupFormKey.currentState!.validate()) {
        signupFormKey.currentState!.save();
        return;
      }

      /// Privacy Policy Check
      if(!checkBox.value){
        TLoader.errorSnackBar(title: 'Accept Privacy Policy', message: 'Please accept our Privacy Policy and Terms of Use to continue.'); // TODO change how privacy policy is set up
        return;
      }
      
      /// Register user in the Firebase Authentication & Save user data in Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim()); 
      
      /// Save Authenticated user data in the Firebase Fire store
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      /// Navigate to offers screen
      Get.offAll(() => const HomeScreen());
    }
    catch (e){
      TLoader.errorSnackBar(title: "Oh Snap!", message: e.toString()); // TODO get rid of context on snack bars and also
    }finally{
      // TODO stop loading splash screen
    }

  }



}
