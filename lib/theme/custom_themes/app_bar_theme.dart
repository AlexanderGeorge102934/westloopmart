import 'package:flutter/material.dart';
import 'package:startup_app/utils/constants/sizes.dart';

class TAppBarThem {
  TAppBarThem._(); //Avoid creating instances

  static lightAppBarTheme (BuildContext context) {
    return AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: MediaQuery.of(context).size.width * 0.06),
      actionsIconTheme: IconThemeData(color: Colors.black, size: MediaQuery.of(context).size.width * 0.06),
      titleTextStyle: TextStyle(
          fontSize: TSizes.fontSizeXl(context), fontWeight: FontWeight.w600, color: Colors.black),
    );
  }

  static darkAppBarTheme(BuildContext context) {
    return AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: MediaQuery.of(context).size.width * 0.06),
      actionsIconTheme: IconThemeData(color: Colors.white, size: MediaQuery.of(context).size.width * 0.06),
      titleTextStyle: TextStyle(
          fontSize: TSizes.fontSizeXl(context), fontWeight: FontWeight.w600, color: Colors.white),
    );
  }


}