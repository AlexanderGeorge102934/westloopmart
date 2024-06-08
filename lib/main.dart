import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:startup_app/features/authentication/screens/login/login.dart';
import 'package:startup_app/features/authentication/screens/sign_up/create_account.dart';
import 'package:startup_app/theme/theme.dart';
import 'package:startup_app/utils/app.dart';





Future<void> main() async{
  /// Widgets Binding
  // final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //
  // /// GetX Local Storage
  // await GetStorage.init();
  //
  // /// Await Splash Screen until other items load
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  /// Initialize Firebase & Authentication Repository
  //Will redirect user to any screen i.e if they're logged in send em here if they're not send em here, etc.
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(const App());
}



