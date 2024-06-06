import 'package:flutter/material.dart';
import 'package:startup_app/utils/constants/sizes.dart';

class TTextTheme{
  TTextTheme._(); //Private constructor Avoid creating instances
  static TextTheme lightTextTheme(BuildContext context) {
    return TextTheme(
      headlineLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeXXXl(context), fontWeight: FontWeight.bold, color: Colors.black),
      headlineMedium: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeXXl(context), fontWeight: FontWeight.w600, color: Colors.black),
      headlineSmall: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeXl(context), fontWeight: FontWeight.w600, color: Colors.black),

      titleLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w600, color: Colors.black),
      titleMedium: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w500, color: Colors.black),
      titleSmall: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w400, color: Colors.black),

      bodyLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w500, color: Colors.black),
      bodyMedium: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.normal, color: Colors.black),
      bodySmall: const TextStyle().copyWith(fontSize: TSizes.fontSizeLg(context),
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.5)),

      labelLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.normal, color: Colors.black),
      labelMedium: const TextStyle().copyWith(fontSize: TSizes.fontSizeLg(context),
          fontWeight: FontWeight.normal,
          color: Colors.black.withOpacity(0.5)),
    );
  }


  static TextTheme darkTextTheme (BuildContext context) {
    return TextTheme(
      headlineLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeXXXl(context), fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeXXl(context), fontWeight: FontWeight.w600, color: Colors.white),

      titleLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w600, color: Colors.white),
      titleMedium: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w500, color: Colors.white),
      titleSmall: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w400, color: Colors.white),

      bodyLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w500, color: Colors.white),
      bodyMedium: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.normal, color: Colors.white),
      bodySmall: const TextStyle().copyWith(fontSize: TSizes.fontSizeLg(context),
          fontWeight: FontWeight.w500,
          color: Colors.white.withOpacity(0.5)),

      labelLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.normal, color: Colors.white),
      labelMedium: const TextStyle().copyWith(fontSize: TSizes.fontSizeLg(context),
          fontWeight: FontWeight.normal,
          color: Colors.white.withOpacity(0.5)),
    );
  }


}