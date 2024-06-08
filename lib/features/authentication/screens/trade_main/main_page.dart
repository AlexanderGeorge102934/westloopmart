// import 'dart:core';
// import 'dart:core';
// // import 'package:carousel_slider/carousel_slider.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class pageOne extends StatefulWidget {
//   const pageOne({super.key});
//   @override
//   State<pageOne> createState() => _pageOneState();
// }
// // we have to create a function that takes what the user inputs
// // the function will take the users name location and
// // in and update the List below to work dynamically.
// // for now in order to make any updates we have to manually include
// // all updates..
// List <String> itemdefinition = [
//   "TV", "Clothes"
// ];
// List <String> postedBy = [
//   "Alex", "Zambi"
// ];
//
// List <String> distance = [
//   "0.1 Miles","0.3 Miles"
// ];
//
// List <String> imagePosted = [
//   "assets/Tv.JPG","assets/SecondTv.jpg"
// ];
// List <String> electronicImages = [
//   "assets/Tv.JPG","assets/SecondTv.jpg"
// ];
// List <String> clothImages = [
//   "assets/.jpg","assets/.jpg"
// ];
// final Map<String, String> myMap = {
//
// };
// //flutter + Dart
// class _pageOneState extends State<pageOne> {
//   String dropdownValue = 'All Items';
//   final _controller = PageController();
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("APP NAME"),
//         backgroundColor: Colors.lightGreen,
//       ),
//       body: Column(
//         children: [
//           Container(// color: Colors.amber,
//             // margin: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white54,
//               // borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 // BoxShadow(
//                 //   color: Colors.black.withOpacity(0.3),
//                 //   // spreadRadius: 2,
//                 //   // blurRadius: 5,
//                 //   offset: Offset(0, 3),
//                 // ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Explore", style: TextStyle(fontSize: 20)),
//                     SizedBox(width: 20),
//                     DropdownButton<String>(
//                       value: dropdownValue,
//                       onChanged: (newValue) {
//                         setState(() {
//                           dropdownValue = newValue!;
//                         });
//                       },
//                       items: <String>['All Items','Clothes', 'Shoes', 'Gadgets']
//                           .map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     // color: Colors.redAccent,
//                     height: 420,
//                     child: ListView(
//                         children: itemdefinition.asMap().entries.map((entry){
//                           final int index = entry.key;
//                           return Padding(padding:const EdgeInsets.all(15.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   height: 300,
//                                   width: 400,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: Stack(
//                                       children: [
//                                         PageView.builder(
//                                           itemCount: imagePosted.length,
//                                           controller: _controller,
//                                           scrollDirection: Axis.horizontal,
//                                           itemBuilder: (BuildContext context, int index) {
//                                             return Container(
//                                               decoration: BoxDecoration(
//                                                 image: DecorationImage(
//                                                   image: AssetImage(imagePosted[index]),
//                                                   fit: BoxFit.cover, // Optional: Adjusts the way the image fits into the container
//                                                 ),
//                                                 // borderRadius: BorderRadius.circular(20)
//                                               ),
//                                             );
//                                             Image.asset(imagePosted[index],fit: BoxFit.cover);
//                                           },
//                                         ),
//                                         Positioned(
//                                           bottom: 7,
//                                           // right: 1,
//                                           left: 170,
//                                           child: SmoothPageIndicator(
//                                             controller: _controller,
//                                             count:imagePosted.length,
//                                             effect: const WormEffect(),
//                                           ),
//                                         ),
//                                       ]
//                                   ),
//                                 ),
//                                 SizedBox(height: 10,),
//                                 Column(
//                                   // mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(itemdefinition[index]),
//                                     Text("By " + postedBy[index]),
//                                     Text(distance[index]),
//                                   ],
//                                 ),
//                                 Divider(),
//                               ],
//                             ),
//                           );
//                         }).toList()
//                     ),
//                     // margin: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       // borderRadius: BorderRadius.circular(20),
//                       // boxShadow: [
//                       //   BoxShadow(
//                       //     // color: Colors.black.withOpacity(0.3),
//                       //     spreadRadius: 2,
//                       //     blurRadius: 5,
//                       //     offset: Offset(0, 3),
//                       //   ),
//                       // ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           BottomNavigationBar(
//             items: const <BottomNavigationBarItem> [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                   backgroundColor: Colors.black
//               ),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.refresh),
//                   label: 'refresh',
//                   backgroundColor: Colors.black
//               ),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.add),
//                   label: 'Add',
//                   backgroundColor: Colors.black
//               ),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.fireplace),
//                   label: 'Fire',
//                   backgroundColor: Colors.black
//               ),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.person),
//                   label: 'Profile',
//                   backgroundColor: Colors.black
//               ),
//             ],
//           ),
//         ],
//
//       ),
//     );
//   }
// }