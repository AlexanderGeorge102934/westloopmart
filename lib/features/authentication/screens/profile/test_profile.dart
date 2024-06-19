import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hello"),
            const SizedBox(height: 10),
            if (user != null) Text(user.email ?? 'No email'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAll(() => const LoginScreen());
                  // Optionally, you can navigate to another screen after signing out
                  // Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text("Sign Out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
