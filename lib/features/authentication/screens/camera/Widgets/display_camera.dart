import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../controllers/camera/camera_controller.dart';

class TDisplayCamera extends StatelessWidget {
  const TDisplayCamera({
    super.key,
    required this.controller,
    required this.size,
  });

  final CustomCameraController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.cameraValue,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            width: size.width,
            height: size.height,
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: CameraPreview(controller.cameraController),
              ),
            ),
          );
        } else {
          /// Show loading indicator while the camera is initializing
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}