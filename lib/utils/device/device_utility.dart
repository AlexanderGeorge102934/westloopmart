
// TODO Need to Implement
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUtils {
  static void hideKeyBoard (BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor (Color color) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color));
  }

  static bool isPortraitOrientation(BuildContext context){
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  // Not finished implementing but a ton of useful functions in the vid
  // Mastering Flutter: Essential Utilities, helper Functions, Constants and much more
  static void launchUrl (String url) async{
    if (await canLaunchUrlString(url)){
      await launchUrlString(url);
    }
    else{
      throw 'Could not launch $url';
    }
  }


}