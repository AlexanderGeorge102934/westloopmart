
import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

/// Light and Dark Elevated button Themes

class TElevatedButtonTheme{

  TElevatedButtonTheme._(); //Avoid creating instances

  ///Light Theme
  static lightElevatedButtonTheme(BuildContext context) {
    return ElevatedButtonThemeData(
        style: ElevatedButton
            .styleFrom( //Creating pre made theme for elevated button
            elevation: 0,
            foregroundColor: Colors.white,
            //color of the text basically
            backgroundColor: Colors.blue,
            disabledForegroundColor: Colors.grey,
            disabledBackgroundColor: Colors.grey,
            side: const BorderSide(color: Colors.blue),
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            textStyle: TextStyle(
                fontSize: TSizes.fontSizeMd(context), color: Colors.white, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)))
        )
    );
  }

  ///Dark Theme
  static darkElevatedButtonTheme (BuildContext context) {
    return ElevatedButtonThemeData(
        style: ElevatedButton
            .styleFrom( //Creating pre made theme for elevated button
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            disabledForegroundColor: Colors.grey,
            disabledBackgroundColor: Colors.grey,
            side: const BorderSide(color: Colors.blue),
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            textStyle: TextStyle(
                fontSize: TSizes.fontSizeMd(context), color: Colors.white, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)))
        )
    );
  }

}