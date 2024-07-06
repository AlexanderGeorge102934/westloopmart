import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/camera/camera_controller.dart';
import 'Widgets/bottom_overlay.dart';
import 'Widgets/display_camera.dart';
import 'Widgets/top_overlay.dart';


class CameraView extends StatelessWidget {
  final List<CameraDescription> cameras;

  const CameraView({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    // Initialize the custom camera controller with the list of available cameras

    final controller = Get.find<CustomCameraController>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          /// Display camera preview
          TDisplayCamera(controller: controller, size: size),

          /// Top overlay with close and done buttons, flash toggle, and camera switch
          TTopOverlay(controller: controller),

          /// Bottom overlay with take picture button and thumbnail list
          TBottomOverlay(controller: controller),
        ],
      ),
    );
  }
}






