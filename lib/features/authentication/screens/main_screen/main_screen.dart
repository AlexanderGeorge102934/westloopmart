import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:startup_app/features/authentication/screens/trades/trades_screen.dart';
import 'package:startup_app/helpers/helpers.dart';
import 'package:startup_app/utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/bottom_navigation_controller/bottom_nav_controller.dart';
import '../add_post/add_post_screen.dart';
import '../home_screen/home_screen.dart';
import '../user_profile/user_profile_screen.dart';
import 'Widgets/add_post_button.dart';
import 'Widgets/bottom_app_bar.dart';

/// Main Screen
class MainScreen extends StatelessWidget {
  final bottomNavController = Get.put(BottomNavController());

  /// List of different screens bottom app bar can switch to
  final List<Widget> _screens = [
    const HomeScreen(),
    TradesScreen(),
    AddPostScreen(),
    Container(color: Colors.green),
    UserProfileScreen(user: FirebaseAuth.instance.currentUser,),

  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Set the height of the app bar
        child: AppBar(
          title: Text(
            'WEST LOOP MART',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24, // Adjust the font size as needed


            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Obx(() => _screens[bottomNavController.selectedIndex.value]),

      /// Middle Add Post Button
      floatingActionButton: TAddPostButton(dark: dark), //Todo make sure the bottom button stays locked in place and can't move
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /// Bottom App Bar
      bottomNavigationBar: TBottomAppBar(dark: dark, bottomNavController: bottomNavController),
    );
  }
}






