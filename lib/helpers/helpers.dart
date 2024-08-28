//Lot of useful helper functions in the video but too much to implement

//Mastering Flutter Essential Utilities helper functions constants and much more

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
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

  static double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const R = 6371e3; // Earth radius in meters
    final phi1 = lat1 * math.pi / 180;
    final phi2 = lat2 * math.pi / 180;
    final deltaPhi = (lat2 - lat1) * math.pi / 180;
    final deltaLambda = (lon2 - lon1) * math.pi / 180;

    final a = math.sin(deltaPhi / 2) * math.sin(deltaPhi / 2) +
        math.cos(phi1) * math.cos(phi2) *
            math.sin(deltaLambda / 2) * math.sin(deltaLambda / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return R * c; // in meters
  }

  static String formatDistance(double distanceInMeters) {
    double distanceInFeet = distanceInMeters * 3.28084;
    double distanceInMiles = distanceInMeters / 1609.34;

    if (distanceInMiles < 1) {
      return '<0.1 miles away';
    } else {
      return '${distanceInMiles.toStringAsFixed(2)} miles away';
    }
  }



}
