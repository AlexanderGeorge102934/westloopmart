
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:startup_app/utils/constants/colors.dart';


class TLoader {


  static errorSnackBar({required title, message = '', duration = 3}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.black,
        backgroundColor: TColors.darkGrey,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        icon: const Icon(Iconsax.info_circle, color: TColors.black)
    );
  }

}