import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../screens/camera/camera_screen.dart';
import '../camera/camera_controller.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();
  final images = <XFile?>[].obs; /// TODO not sure if this should be allowed to be nullable or not
  final ImagePicker picker = ImagePicker();
  late CustomCameraController cameraController;

  Future<void> initializeCameraController() async {
    final cameras = await availableCameras();
    cameraController = Get.put(CustomCameraController(cameras));
  }

  void pickImage(BuildContext context) { // TODO fix context
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                          child: const Column(
                            children: [
                              Icon(Icons.image, size: 60.0,),
                              SizedBox(height: 12.0),
                              Text(
                                "Gallery",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            _imgFromGallery();
                            Navigator.pop(context);
                          },
                        )),
                    Expanded(
                        child: InkWell(
                          child: const SizedBox(
                            child: Column(
                              children: [
                                Icon(Icons.camera_alt, size: 60.0,),
                                SizedBox(height: 12.0),
                                Text(
                                  "Camera",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            initializeCameraController();
                            _imgFromCamera(); // TODO figure out way in which to get image from camera screen and then have it saved into the widgets
                          },
                        ))
                  ],
                )),
          );
        }
    );
  }


  _imgFromGallery() async {
    await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );
  }

  Future<void> _imgFromCamera() async {
    await initializeCameraController();
    
    await Get.to(() => CameraView(cameras: cameraController.cameras));
    final result = cameraController.imagesList;
    debugPrint(" Result $result");

    if(images.length != 10){
      // Add each file from the result to the images list as XFile.
      for (var file in result) {
        var imageFile = XFile(file.path);
        // Check if the path already exists in the images list
        bool isDuplicate = images.any((image) => image?.path == imageFile.path);
        if (!isDuplicate) {
          images.add(imageFile);
        }
      }
    }
  }
}


