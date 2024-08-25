import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/features/authentication/screens/add_post/add_post.dart';
import 'package:startup_app/features/authentication/screens/profile/test_profile.dart';
import 'package:startup_app/features/authentication/screens/trades/trades_screen.dart';
import 'package:startup_app/helpers/helpers.dart';
import 'package:startup_app/utils/constants/colors.dart';
import '../../controllers/bottom_navigation_controller/bottom_nav_controller.dart';
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
    UserProfileScreen(user: FirebaseAuth.instance.currentUser,),
    const TestScreen(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Obx(() => _screens[bottomNavController.selectedIndex.value]),

      /// Middle Add Post Button
      floatingActionButton: TAddPostButton(dark: dark), //Todo make sure the bottom button stays locked in place and can't move
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /// Bottom App Bar
      bottomNavigationBar: TBottomAppBar(dark: dark, bottomNavController: bottomNavController),
    );
  }
}






