
import 'package:flutter/material.dart';
import './custom_themes/text_theme.dart';
import 'custom_themes/app_bar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
class TAppTheme{
  TAppTheme._(); //Make constructor private Avoid creating instances

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      //Puts in light mode
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      //Scaffold is treated as a different screen
      textTheme: TTextTheme.lightTextTheme(context),
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme(context),
      appBarTheme: TAppBarThem.lightAppBarTheme(context),
      chipTheme: TChipTheme.lightChipTheme(context),
      checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme(context),
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme(context),
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme(context),
    );
  }
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      //Puts in light mode
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,

      //Scaffold is treated as a different screen
      textTheme: TTextTheme.darkTextTheme(context),
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme(context),
      appBarTheme: TAppBarThem.darkAppBarTheme(context),
      chipTheme: TChipTheme.darkChipTheme(context),
      checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme(context),
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme(context),
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme(context),
    );
  }
}