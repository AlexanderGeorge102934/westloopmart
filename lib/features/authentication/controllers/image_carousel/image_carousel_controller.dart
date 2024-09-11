import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// --- Image Carousel Controller --- ///
class ImageCarouselController extends GetxController {
  static ImageCarouselController get instance => Get.find();

  var currentPage = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}