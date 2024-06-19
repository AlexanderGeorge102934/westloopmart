// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:startup_app/utils/constants/image_strings.dart';
//
// import '../../controllers/camera/camera_controller.dart';
// import '../../controllers/login/login_controller.dart';
//
// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});
//
//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   File? imageFile; // Stores image file
//   final picker = ImagePicker();
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(CameraController());
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           imageFile == null
//               ? Image.asset(TImages.facebook)
//               : ClipRRect(child: Image.file(imageFile!)),
//           SizedBox(
//             width: double.infinity,
//             child: OutlinedButton(
//                 onPressed: () async {
//                   Map<Permission, PermissionStatus> statuses =
//                   await [Permission.storage, Permission.camera].request();
//                   if (statuses[Permission.storage]!.isGranted &&
//                       statuses[Permission.camera]!.isGranted) {
//                     // controller.getImage(ImageSource.camera);
//                   } else {
//                     debugPrint('No Camera Permission given');
//                   }
//                 },
//                 child: const Text("Press for Camera")),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void showImagePicker(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (builder) {
//           return Card(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 5.2,
//               margin: const EdgeInsets.only(top: 8.0),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: const Icon(Icons.camera),
//                     title: const Text("Camera"),
//                     onTap: () {
//                       _imgFromCamera();
//                       Navigator.pop(context);
//                     },
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.photo_library),
//                     title: const Text("Gallery"),
//                     onTap: () {
//                       _imgFromGallery();
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   _imgFromGallery() async {
//     await picker.pickImage(source: ImageSource.gallery, imageQuality: 50).then( //TOdo image quality
//             (value){
//               if(value != null){
//                 _cropImage(File(value.path));
//               }
//             }
//     );
//   }
//
//   _imgFromCamera() async {
//     await picker.pickImage(source: ImageSource.camera, imageQuality: 50).then(
//             (value){
//           if(value != null){
//             _cropImage(File(value.path));
//           }
//         }
//     );
//   }
//
//   _cropImage(File imgFile) async{
//     final croppedFile = await ImageCropper().cropImage(
//       sourcePath: imgFile.path,
//
//       uiSettings: [
//         AndroidUiSettings(
//           toolbarTitle: "Cropper Android",
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false,
//           aspectRatioPresets: [
//             CropAspectRatioPreset.square,
//             CropAspectRatioPreset.ratio3x2,
//             CropAspectRatioPreset.original,
//             CropAspectRatioPreset.ratio4x3,
//             CropAspectRatioPreset.ratio16x9
//           ]
//         ),
//
//         IOSUiSettings(
//           title: 'Cropper',
//           aspectRatioPresets: [
//             CropAspectRatioPreset.original,
//             CropAspectRatioPreset.square,
//             CropAspectRatioPreset.ratio3x2,
//             CropAspectRatioPreset.ratio4x3,
//             CropAspectRatioPreset.ratio5x3,
//             CropAspectRatioPreset.ratio5x4,
//             CropAspectRatioPreset.ratio7x5,
//             CropAspectRatioPreset.ratio16x9
//           ],
//         ),
//       ]
//     );
//
//     if (croppedFile != null){
//       imageCache.clear();
//       setState(() {
//         imageFile = File(croppedFile.path);
//       });
//     }
//   }
//
//   // aspectRatioPre: Platform.isAndroid
//   // ? [
//   // CropAspectRatioPreset.square,
//   // CropAspectRatioPreset.ratio3x2,
//   // CropAspectRatioPreset.original,
//   // CropAspectRatioPreset.ratio4x3,
//   // CropAspectRatioPreset.ratio16x9
//   // ] : [
//   // CropAspectRatioPreset.original,
//   // CropAspectRatioPreset.square,
//   // CropAspectRatioPreset.ratio3x2,
//   // CropAspectRatioPreset.ratio4x3,
//   // CropAspectRatioPreset.ratio5x3,
//   // CropAspectRatioPreset.ratio5x4,
//   // CropAspectRatioPreset.ratio7x5,
//   // CropAspectRatioPreset.ratio16x9,
//   // ],
//
//
//
// }
//
