import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //Avoid creating instance

  /// Light Theme
  static lightOutlinedButtonTheme (BuildContext context) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.blue),
        textStyle: TextStyle(
            fontSize: TSizes.fontSizeMd(context),
            color: Colors.black,
            fontWeight: FontWeight.w600),
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.05),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context))),
      ),
    );
  }


  /// Dark Theme
  static darkOutlinedButtonTheme (BuildContext context) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.blueAccent),
        textStyle: TextStyle(
            fontSize: TSizes.fontSizeMd(context), color: Colors.white, fontWeight: FontWeight.w600),
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.05,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context))),
      ),
    );
  }

}