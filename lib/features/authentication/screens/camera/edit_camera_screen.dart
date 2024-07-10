import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPhotoScreen extends StatelessWidget {
  final File photo;

  const EditPhotoScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Photo'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.file(photo),
            ),
            // Add your photo editing widgets here
            ElevatedButton(
              onPressed: () {
                // Implement save or edit functionality
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
