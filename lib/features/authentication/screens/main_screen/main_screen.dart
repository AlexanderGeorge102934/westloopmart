import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:startup_app/features/authentication/screens/trades/trades_screen.dart';
import 'package:startup_app/helpers/helpers.dart';
import 'package:startup_app/utils/constants/sizes.dart';
import '../../controllers/bottom_navigation_controller/bottom_nav_controller.dart';
import '../add_post/add_post_screen.dart';
import '../home_screen/home_screen.dart';
import '../user_profile/user_profile_screen.dart';
import 'Widgets/add_post_button.dart';
import 'Widgets/app_bar.dart';
import 'Widgets/bottom_app_bar.dart';

/// Main Screen
class MainScreen extends StatelessWidget {
  final bottomNavController = Get.put(BottomNavController());

  final List<Widget> _screens = [
    const HomeScreen(),
    TradesScreen(),
    AddPostScreen(),
    Container(color: Colors.green),
    UserProfileScreen(user: FirebaseAuth.instance.currentUser,),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(TSizes.spaceBtwSections(context) * 1.2),
          child: TMainAppBar(bottomNavController: bottomNavController)
      ),
      body: Obx(() => _screens[bottomNavController.selectedIndex.value]),
      floatingActionButton: TAddPostButton(dark: dark),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TBottomAppBar(dark: dark, bottomNavController: bottomNavController),
    );
  }
}

