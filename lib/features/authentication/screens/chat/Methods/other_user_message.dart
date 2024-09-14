import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';


/// --- Method to Style Other User Message --- ///
Widget TOtherUserMessage(String message, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: TSizes.xs(context)),
    child: Row(
      children: [
        Flexible(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(TSizes.defaultSpace(context) * 0.6),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
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
                color: TColors.black,
                fontSize: TSizes.fontSizeMd(context),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    ),
  );
}
