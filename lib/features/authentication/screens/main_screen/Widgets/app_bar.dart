import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/bottom_navigation_controller/bottom_nav_controller.dart';

class TMainAppBar extends StatelessWidget {
  const TMainAppBar({
    super.key,
    required this.bottomNavController,
  });

  final BottomNavController bottomNavController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Obx(() => bottomNavController.selectedIndex.value == 4
          ? const Text('', // Title doesn't appear when on user profile screen
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18, // Adjust the font size as needed
        ),
      ) : Text(
        'WEST LOOP MART',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: TSizes.fontSizeXXl(context),
        ),
      ),
      ),
      centerTitle: true,
    );
  }
}