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
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // remove default padding
                      ),
                      onPressed: () async {

                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person, color: Colors.black,), // leading icon
                              SizedBox(width: 8,), // space between icon and text
                              Text(
                                "Personal Information",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Spacer(), // add a spacer to push the arrow to the right
                          Icon(Icons.chevron_right, color: Colors.black,), // trailing arrow
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: TSizes.spaceBtwItems(context),),

                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // remove default padding
                      ),
                      onPressed: () async {

                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.notifications, color: Colors.black,), // leading icon
                              SizedBox(width: 8,), // space between icon and text
                              Text(
                                "Notifications",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Spacer(), // add a spacer to push the arrow to the right
                          Icon(Icons.chevron_right, color: Colors.black,), // trailing arrow
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: TSizes.spaceBtwItems(context),),

                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // remove default padding
                      ),
                      onPressed: () async {

                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.lock, color: Colors.black,), // leading icon
                              SizedBox(width: 8,), // space between icon and text
                              Text(
                                "Privacy and Sharing",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Spacer(), // add a spacer to push the arrow to the right
                          Icon(Icons.chevron_right, color: Colors.black,), // trailing arrow
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: TSizes.spaceBtwItems(context),),

                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // remove default padding
                      ),
                      onPressed: () async {

                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.help, color: Colors.black,), // leading icon
                              SizedBox(width: 8,), // space between icon and text
                              Text(
                                "Help",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Spacer(), // add a spacer to push the arrow to the right
                          Icon(Icons.chevron_right, color: Colors.black,), // trailing arrow
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: TSizes.spaceBtwItems(context),),

                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // remove default padding
                      ),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Get.offAll(() => const LoginScreen());
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.logout, color: Colors.black,), // leading icon
                              SizedBox(width: 8,), // space between icon and text
                              Text(
                                "Sign Out",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Spacer(), // add a spacer to push the arrow to the right
                          Icon(Icons.chevron_right, color: Colors.black,), // trailing arrow
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}