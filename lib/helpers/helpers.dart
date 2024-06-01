//Lot of useful helper functions in the video but too much to implement

//Mastering Flutter Essential Utilities helper functions constants and much more

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class THelperFunctions{

  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }

  static void navigateToScreen(BuildContext context, Widget screen){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_)=> screen),
    );
  } //Check to see if this works

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static List<T> removeDuplicates<T>(List<T> list){
    return list.toSet().toList();
  }


}
