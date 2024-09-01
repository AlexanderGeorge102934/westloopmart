import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../login/login.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.spaceBtwSections(context) * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Menu",
              style: TextStyle(
                fontSize: TSizes.fontSizeXXXl(context),
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: TSizes.appBarHeight(context),),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAll(() => const LoginScreen());
                },
                child: const Text(
                  "Sign Out",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),),
            )


          ],
        ),
      ),

    );
  }
}
