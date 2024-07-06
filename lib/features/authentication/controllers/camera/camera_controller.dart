import 'dart:io';

import 'package:camera/camera.dart';
import 'package:external_path/external_path.dart';
import 'package:get/get.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:startup_app/utils/ui/loader.dart';

class CustomCameraController extends GetxController {
  static CustomCameraController get instance => Get.find();

  late CameraController cameraController;
  late Future<void> cameraValue;
  var imagesList = <File>[].obs;
  var isFlashOn = false.obs;
  var isRearCamera = true.obs;
  final List<CameraDescription> cameras;

  CustomCameraController(this.cameras);

  @override
  void onInit() {
    super.onInit();
    startCamera(0); // Initialize with the rear camera
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }

  void startCamera(int cameraIndex) {
    cameraController = CameraController(
      cameras[cameraIndex],
      ResolutionPreset.high,
      enableAudio: false,
    );
    cameraValue = cameraController.initialize();
  }

  Future<File> saveImage(XFile image) async {
    final downloadPath = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File('$downloadPath/$fileName');

    try {
      await file.writeAsBytes(await image.readAsBytes());
    } catch (e) {
      TLoader.errorSnackBar(title: 'Save Error', message: 'Failed to save image.');
    }

    return file;
  }

  Future<void> takePicture() async {
    if (cameraController.value.isTakingPicture || !cameraController.value.isInitialized) {
      return;
    }

    await cameraController.setFlashMode(isFlashOn.value ? FlashMode.torch : FlashMode.off);

    if (imagesList.length >= 10) {
      TLoader.errorSnackBar(title: 'Limit Reached', message: 'You can only take up to 10 images.');
      return;
    }

    try {
      final image = await cameraController.takePicture();

      if (isFlashOn.value) {
        await cameraController.setFlashMode(FlashMode.off);
      }

      final file = await saveImage(image);
      imagesList.add(file);
      MediaScanner.loadMedia(path: file.path);
    } catch (e) {
      TLoader.errorSnackBar(title: 'Capture Error', message: 'Failed to take picture.');
    }
  }

  void toggleFlash() {
    isFlashOn.value = !isFlashOn.value;
  }

  void toggleCamera() {
    isRearCamera.value = !isRearCamera.value;
    startCamera(isRearCamera.value ? 0 : 1);
  }
}
