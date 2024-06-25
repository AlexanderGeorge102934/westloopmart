import 'dart:core';
import 'dart:core';
// import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../bottom_navigation_bar.dart';
import '../../../../utils/constants/colors.dart';
import '../profile/test_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _pageOneState();
}
// we have to create a function that takes what the user inputs
// the function will take the users name location and
// in and update the List below to work dynamically.
// for now in order to make any updates we have to manually include
// all updates..

final Map<String, String> myMap = {

};
//flutter + Dart
class _pageOneState extends State<HomeScreen> {
  String dropdownValue = 'All Items';
  final _controller = PageController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary,
      ),
      body: Column(
        children: [
          Container(// color: Colors.amber,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Explore", style: TextStyle(fontSize: 20)),
                    SizedBox(width: 20),
                    DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['All Items','Clothes', 'Shoes', 'Gadgets']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // NewWidget(controller: _controller),
        ],
      ),
    );
  }
}




