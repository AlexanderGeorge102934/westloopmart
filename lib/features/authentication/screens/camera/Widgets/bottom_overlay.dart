import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controllers/camera/camera_controller.dart';
import '../edit_camera_screen.dart';

class BottomOverlay extends StatelessWidget {
  const BottomOverlay({
    super.key,
    required this.controller,
  });

  final CustomCameraController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: size.width,
        color: Colors.black.withOpacity(0.7),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Take picture button
            GestureDetector(
              onTap: controller.takePicture,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.transparent),
                ),
                child: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black)

                    ),
                  ),
                ),
              ),
            ),
            const Gap(10),
            // Thumbnails of captured images
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 100,
                child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.imagesList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(2),
                      child: GestureDetector(
                        onTap: () => Get.to(() => EditPhotoScreen(photo: controller.imagesList[index])),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            height: 100,
                            width: 100,
                            opacity: const AlwaysStoppedAnimation(0.7),
                            image: FileImage(
                              File(controller.imagesList[index].path),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}