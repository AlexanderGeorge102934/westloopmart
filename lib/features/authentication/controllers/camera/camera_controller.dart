import 'dart:io';
import 'package:camera/camera.dart';
import 'package:external_path/external_path.dart';
import 'package:get/get.dart';
import 'package:media_scanner/media_scanner.dart';

class CustomCameraController extends GetxController {
  static CustomCameraController get instance => Get.find(); // TODO not sure if this is necessary

  late CameraController cameraController;
  late Future<void> cameraValue;
  var imagesList = <File>[].obs;
  var isFlashOn = false.obs;
  var isRearCamera = true.obs;
  final List<CameraDescription> cameras;

  CustomCameraController(this.cameras);

  @override
  void onInit() {
    startCamera(0);
    super.onInit();
  }

  Future<File> saveImage(XFile image) async {
    final downloadPath = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File('$downloadPath/$fileName');

    try {
      await file.writeAsBytes(await image.readAsBytes());
    } catch (_) {}

    return file;
  }

  void takePicture() async {
    XFile? image;

    if (cameraController.value.isTakingPicture || !cameraController.value.isInitialized) {
      return;
    }

    await cameraController.setFlashMode(isFlashOn.value ? FlashMode.torch : FlashMode.off);

    if(imagesList.length == 10){
      /// TODO add a snack bar or something saying you have 10 images
      return; /// Can't take pictures if you have more than 10 images
    }

    image = await cameraController.takePicture();

    if (isFlashOn.value) {
      cameraController.setFlashMode(FlashMode.off);
    }

    final file = await saveImage(image);
    imagesList.add(file);
    update();
    MediaScanner.loadMedia(path: file.path);
  }

  void startCamera(int camera) {
    cameraController = CameraController(
      cameras[camera],
      ResolutionPreset.high,
      enableAudio: false,
    );
    cameraValue = cameraController.initialize();
  }

  void toggleFlash() {
    isFlashOn.value = !isFlashOn.value;
  }

  void toggleCamera() {
    isRearCamera.value = !isRearCamera.value;
    startCamera(isRearCamera.value ? 0 : 1);
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
