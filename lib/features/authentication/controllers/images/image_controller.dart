import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../screens/camera/camera_screen.dart';
import '../camera/camera_controller.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();
  final images = <XFile?>[].obs; // Consider if this should be allowed to be nullable or not
  final ImagePicker picker = ImagePicker();
  late CustomCameraController cameraController;

  Future<void> initializeCameraController() async {
    final cameras = await availableCameras();
    cameraController = Get.put(CustomCameraController(cameras));
  }

  Future<void> imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      images.add(pickedFile);
    }
  }

  Future<void> imgFromCamera() async {
    await initializeCameraController();
    await Get.to(() => CameraView(cameras: cameraController.cameras));
    final result = cameraController.imagesList;

    if (images.length < 10) {
      for (var file in result) {
        var imageFile = XFile(file.path);
        bool isDuplicate = images.any((image) => image?.path == imageFile.path);
        if (!isDuplicate) {
          images.add(imageFile);
        }
      }
    }
  }


  void clearImages() {
    images.clear(); // This will clear all the images in the list
  }
}
