// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// import 'features/authentication/controllers/bottom_navigation_bar/bottom_navigation_controller.dart';
//
// class BottomNavBar extends StatelessWidget {
//
//   const BottomNavBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Obx(() => BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//           backgroundColor: Colors.black,
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.refresh),
//           label: 'Refresh',
//           backgroundColor: Colors.black,
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.add),
//           label: 'Add',
//           backgroundColor: Colors.black,
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.fireplace),
//           label: 'Fire',
//           backgroundColor: Colors.black,
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Profile',
//           backgroundColor: Colors.black,
//         ),
//       ],
//       currentIndex: controller.selectedIndex.value,
//       selectedItemColor: Colors.amber[800],
//       onTap: controller.changeIndex,
//     ));
//   }
// }