import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';


import '../../controllers/camera/camera_controller.dart';


class CameraView extends StatelessWidget {
  final List<CameraDescription> cameras;

  const CameraView({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomCameraController(cameras));
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(255, 255, 255, .7),
        shape: const CircleBorder(),
        onPressed: controller.takePicture,
        child: const Icon(
          Icons.camera_alt,
          size: 40,
          color: Colors.black87,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          FutureBuilder(
            future: controller.cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  width: size.width,
                  height: size.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: 100,
                      child: CameraPreview(controller.cameraController),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 5, top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: controller.toggleFlash,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(50, 0, 0, 0),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Obx(() => Icon(
                            controller.isFlashOn.value ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 30,
                          )),
                        ),
                      ),
                    ),
                    const Gap(10),
                    GestureDetector(
                      onTap: controller.toggleCamera,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(50, 0, 0, 0),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Obx(() => Icon(
                            controller.isRearCamera.value ? Icons.camera_rear : Icons.camera_front,
                            color: Colors.white,
                            size: 30,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, bottom: 75),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Obx(() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.imagesList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(2),
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
                          );
                        },
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
