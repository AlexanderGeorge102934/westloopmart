import 'package:flutter/material.dart';
import 'package:startup_app/utils/constants/sizes.dart';
import '../../../../../utils/constants/colors.dart';

/// --- Method to Style My Messages --- ///
Widget TMyMessage(String message, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: TSizes.xs(context)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(TSizes.defaultSpace(context) * 0.6),
            decoration: BoxDecoration(
              color: TColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(TSizes.defaultSpace(context) * 0.6),
                topRight: Radius.circular(TSizes.defaultSpace(context) * 0.6),
                bottomRight: Radius.circular(TSizes.defaultSpace(context) * 0.6),
                bottomLeft: Radius.circular(TSizes.defaultSpace(context) * 0.6),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              message,
              style: TextStyle(
                color: TColors.white,
                fontSize: TSizes.fontSizeMd(context),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}