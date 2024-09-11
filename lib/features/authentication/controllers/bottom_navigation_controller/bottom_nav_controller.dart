import 'package:get/get.dart';

/// --- Bottom Navigation Controller --- ///
class BottomNavController extends GetxController {
  static BottomNavController get instance => Get.find();

  /// Keep track of the selected index
  var selectedIndex = 0.obs;

  /// Change the index
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
