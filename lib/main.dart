
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:startup_app/firebase_options.dart';
import 'package:startup_app/utils/app.dart';

import 'data/repositories/authentication/authentication_repository.dart';





Future<void> main() async {

  /// Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// GetX Local Storage
  await GetStorage.init();


  /// Await Splash Screen until other items load
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  /// Initialize Firebase & Authentication Repository
  /// Will redirect user to any screen i.e if they're logged in send em here if they're not send em here, etc.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
          (FirebaseApp value) => Get.put(AuthenticationRepository())
  );

  // await FirebaseAppCheck.instance.activate(
  //   webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  //   androidProvider: AndroidProvider.debug,
  //   appleProvider: AppleProvider.appAttest,
  // );


  runApp(const App());
}



