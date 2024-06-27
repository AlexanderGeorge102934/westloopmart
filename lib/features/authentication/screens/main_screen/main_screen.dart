import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/features/authentication/screens/add_post/add_post.dart';
import 'package:startup_app/features/authentication/screens/profile/test_profile.dart';
import 'package:startup_app/helpers/helpers.dart';
import 'package:startup_app/utils/constants/colors.dart';
import '../../controllers/bottom_navigation_controller/bottom_nav_controller.dart';
import '../home_screen/home_screen.dart';


class MainScreen extends StatelessWidget {
  final bottomNavController = Get.put(BottomNavController());

  final List<Widget> _screens = [
    const HomeScreen(),
    Container(color: Colors.red),
    AddPostScreen(),
    Container(color: Colors.green),
    const TestScreen(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Obx(() => _screens[bottomNavController.selectedIndex.value]),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          bottomNavController.changeIndex(2);
        },
        backgroundColor: dark ? TColors.white : Colors.black,
        foregroundColor: dark ? Colors.black : TColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 0,
        tooltip: 'Increment',
        child: const Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: dark ? TColors.black : Colors.white,

          surfaceTintColor: TColors.primary,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              /// Home Button
              IconButton(
                onPressed: () {
                  bottomNavController.changeIndex(0);
                },
                icon: Icon(Icons.home, color: dark ? TColors.white : Colors.black), iconSize: 30,
              ),

              /// Trade Button
              IconButton(
                onPressed: () {
                  bottomNavController.changeIndex(1);
                },
                icon: Icon(Icons.arrow_downward, color: dark ? TColors.white : Colors.black, ),iconSize: 30,
              ),

              /// Fire Button
              IconButton(
                onPressed: () {
                  bottomNavController.changeIndex(3);
                },
                icon: Icon(Icons.fire_extinguisher, color: dark ? TColors.white : Colors.black), iconSize: 30,
              ),

              /// Profile Button
              IconButton(
                onPressed: () {
                  bottomNavController.changeIndex(4);
                },
                icon: Icon(Icons.person, color: dark ? TColors.white : Colors.black), iconSize: 30,
              )
            ],
          )
      ),
    );
  }
}


