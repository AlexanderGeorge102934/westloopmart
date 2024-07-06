import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:startup_app/components/post.dart';
import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _pageOneState();
}



//flutter + Dart
class _pageOneState extends State<HomeScreen> {
  String dropdownValue = 'All Items';
  final _controller = PageController();
  late Position _currentPosition;

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      print("Failed to get location: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                elevation: 0,
                borderRadius: BorderRadius.circular(10),
                underline: Container(
                  height: 2,
                  color: Colors.transparent, // Underline color
                ),
                value: dropdownValue,
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['All Items', 'Clothes', 'Shoes', 'Gadgets']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection("User Posts").orderBy("Timestamp", descending: false).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Error'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: Text('No data has been found')); /// Todo change with a screen that says no posts made yet
                }

                if (snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No posts found')); /// Todo change with a screen that says no posts made yet
                }

                final docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final post = docs[index];
                    final imageUrls = List<String>.from(post['ImageUrls']);
                    return TPost(
                      user: post['UserName'],
                      description: post['Description'],
                      title: post['Title'],
                      imageUrls: imageUrls,
                      userPosition: _currentPosition,
                      postPosition: post['Location'],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
