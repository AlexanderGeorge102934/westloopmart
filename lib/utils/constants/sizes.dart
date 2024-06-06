import 'package:flutter/cupertino.dart';

class TSizes {

  // TODO Need to adjust
  //Padding and margin sizes
  static double xs(BuildContext context) => MediaQuery.of(context).size.width * 0.01;
  static double sm(BuildContext context) => MediaQuery.of(context).size.width * 0.02;
  static double md(BuildContext context) => MediaQuery.of(context).size.width * 0.04;
  static double lg(BuildContext context) => MediaQuery.of(context).size.width * 0.06;
  static double xl(BuildContext context) => MediaQuery.of(context).size.width * 0.08;

  //Icon sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  //Font sizes
  static const double fontSizeSm = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;

  //Button sizes
  static const double buttonHeight = 18.0;
  static const double buttonRadius = 12.0;
  static double buttonWidth(BuildContext context) => MediaQuery.of(context).size.width * 0.4;
  static const double buttonElevation = 4.0;

  //Image sizes
  static const double imageThumbSize = 80.0;

  //Default spacing between sections
  static double defaultSpace(BuildContext context) => MediaQuery.of(context).size.height * 0.03;
  static double spaceBtwItems(BuildContext context) => MediaQuery.of(context).size.height * 0.01;
  static double spaceBtwSections(BuildContext context) => MediaQuery.of(context).size.height * 0.04;


  //Border radius
  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 12.0;

  //divider height
  static double dividerHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.001;

  //product item dimensions
  static const double productImageSize = 120.0;
  static const double productImageRadius = 16.0;
  static const double productItemHeight = 160.0;

  //Input field
  static const double inputFieldRadius = 12.0;
  static double spaceBtwInputFields(BuildContext context) => MediaQuery.of(context).size.height * 0.02;

  //Card sizes
  static const double cardRadiusLg = 16.0;
  static const double cardRadiusMd = 12.0;
  static const double cardRadiusSm = 10.0;
  static const double cardRadiusXs = 6.0;
  static const double cardElevation = 2.0;

  //loading
  static const double loadingIndicatorHeight = 200.0;

  //Grid view spacing
  static double gridViewSpacing(BuildContext context) => MediaQuery.of(context).size.height * 0.02;

  // AppBar height
  static const double appBarHeight = 56.0;

}