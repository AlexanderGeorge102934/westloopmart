
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:startup_app/utils/constants/colors.dart';
import 'package:startup_app/utils/constants/sizes.dart';

import '../../helpers/helpers.dart';

class TLoader {

  static warningSnackBar({required BuildContext context, required title, message= '', duration = 3}){
    final dark = THelperFunctions.isDarkMode(context);
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: dark ? TColors.darkGrey : TColors.lightGrey,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(TSizes.defaultSpace(context)),
      icon: const Icon(Iconsax.info_circle)
    );
  }


  static errorSnackBar({required BuildContext context, required title, message= '', duration = 3}){
    final dark = THelperFunctions.isDarkMode(context);
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: dark ? TColors.white: TColors.black,
        backgroundColor: dark ? TColors.darkGrey : TColors.lightGrey,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: EdgeInsets.all(TSizes.defaultSpace(context)),
        icon: const Icon(Iconsax.info_circle)
    );
  }

}