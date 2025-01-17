import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/camera/camera_controller.dart';

/// --- Top Overlay of Camera --- ///
class TTopOverlay extends StatelessWidget {
  const TTopOverlay({
    super.key,
    required this.controller,
  });

  final CustomCameraController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.black.withOpacity(0.7),
        padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems(context)), // TODO add more space?
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    /// Done button
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.white, fontSize: TSizes.fontSizeXl(context)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    /// Flash toggle button
                    GestureDetector(
                      onTap: controller.toggleFlash,
                      child: Obx(() => Icon(
                        controller.isFlashOn.value ? Icons.flash_on : Icons.flash_off,
                        color: Colors.white,
                        size: TSizes.iconLg(context),
                      )),
                    ),
                    Gap(MediaQuery.of(context).size.width * 0.05),

                    /// Camera switch button
                    /// TODO Freezes when switching to selfie mode
                    GestureDetector(
                      onTap: controller.toggleCamera,
                      child: Obx(() => Icon(
                        controller.isRearCamera.value ? Icons.camera_rear : Icons.camera_front,
                        color: Colors.white,
                        size: TSizes.iconLg(context),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}