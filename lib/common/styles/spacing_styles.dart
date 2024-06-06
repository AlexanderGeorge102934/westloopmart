import 'package:flutter/material.dart';
import '../../utils/constants/sizes.dart';

class TSpacingStyle {
  static EdgeInsetsGeometry paddingWithAppBarHeight(BuildContext context) {
    return EdgeInsets.only(
      top: TSizes.appBarHeight,
      left: TSizes.defaultSpace(context),
      bottom: TSizes.defaultSpace(context),
      right: TSizes.defaultSpace(context),
    );
  }
}
