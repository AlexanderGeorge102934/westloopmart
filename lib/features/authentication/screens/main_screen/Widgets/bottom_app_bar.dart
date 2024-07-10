import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../controllers/bottom_navigation_controller/bottom_nav_controller.dart';

class TBottomAppBar extends StatelessWidget {
  const TBottomAppBar({
    super.key,
    required this.dark,
    required this.bottomNavController,
  });

  final bool dark;
  final BottomNavController bottomNavController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    );
  }
}