import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100), color: Colors.white),
          child: IconButton(
            onPressed: (){},
            icon: Image(
              width: TSizes.iconMd(context),
              height: TSizes.iconMd(context),
              image: const AssetImage(TImages.google),
            ),
          ),
        ),
        SizedBox(width: TSizes.spaceBtwItems(context),),
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100), color: Colors.white),
          child: IconButton(
            onPressed: (){},
            icon: Image(
              width: TSizes.iconMd(context),
              height: TSizes.iconMd(context),
              image: const AssetImage(TImages.facebook)
            ),
          ),
        ),
      ],
    );
  }
}