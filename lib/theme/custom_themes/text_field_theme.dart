import 'package:flutter/material.dart';
import 'package:startup_app/utils/constants/sizes.dart';

class TTextFormFieldTheme{
  TTextFormFieldTheme._(); //Avoid creating instance

  /// Light Theme
  static InputDecorationTheme lightInputDecorationTheme (BuildContext context) {
    return InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeSm(context), color: Colors.black),
      hintStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeSm(context), color: Colors.black),
      errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
      floatingLabelStyle: const TextStyle().copyWith(
          color: Colors.black.withOpacity(0.8)),
      border: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)),
          borderSide: BorderSide(width: TSizes.borderWidth(context), color: Colors.grey)
      ),
      enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)),
          borderSide: BorderSide(width: TSizes.borderWidth(context), color: Colors.grey)
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)),
          borderSide: BorderSide(width: TSizes.borderWidth(context), color: Colors.black12)
      ),
      errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)),
          borderSide: BorderSide(width: TSizes.borderWidth(context), color: Colors.red)
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)),
          borderSide: BorderSide(width: TSizes.borderWidth(context) + 0.002, color: Colors.red)
      ),
    );
  }

  /// Dark Theme
  static InputDecorationTheme darkInputDecorationTheme (BuildContext context) {
    return InputDecorationTheme(
      errorMaxLines: 2,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeSm(context), color: Colors.white),
      hintStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeSm(context), color: Colors.white),
      errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
      floatingLabelStyle: const TextStyle().copyWith(
          color: Colors.white.withOpacity(0.8)),
      border: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)),
          borderSide: BorderSide(width: TSizes.borderWidth(context), color: Colors.grey)
      ),
      enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)),
          borderSide: BorderSide(width: TSizes.borderWidth(context), color: Colors.grey)
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)),
          borderSide: BorderSide(width: TSizes.borderWidth(context), color: Colors.white12)
      ),
      errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)),
          borderSide: BorderSide(width: TSizes.borderWidth(context), color: Colors.red)
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)),
          borderSide: BorderSide(width: TSizes.borderWidth(context) + 0.002, color: Colors.red)
      ),
    );
  }


}