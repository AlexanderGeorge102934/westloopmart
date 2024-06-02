import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/helpers/helpers.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/texts.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? TColors.darkGrey: TColors.grey, thickness: 1.0, indent: 60, endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: dark ? TColors.darkGrey: TColors.grey, thickness: 1.0, indent: 5, endIndent: 60)),
      ],
    );
  }
}