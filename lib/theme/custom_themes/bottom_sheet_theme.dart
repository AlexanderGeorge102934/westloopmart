import 'package:flutter/material.dart';
import 'package:startup_app/utils/constants/sizes.dart';

class TBottomSheetTheme{
  TBottomSheetTheme._(); //Avoid creating instanes

  /// Light Theme
  static BottomSheetThemeData lightBottomSheetTheme(BuildContext context) {
    return BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Colors.white,
      modalBackgroundColor: Colors.white,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)+0.005)),
    );
  }

  /// Dark Theme
  static BottomSheetThemeData darkBottomSheetTheme(BuildContext context) {
    return BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Colors.black,
      modalBackgroundColor: Colors.black,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)+0.005)),
    );
  }
}