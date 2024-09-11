import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:startup_app/utils/constants/sizes.dart';
import '../../../../components/post/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _pageOneState();
}

class _pageOneState extends State<HomeScreen> {
  String selectedCategory = 'All Items';
  late Future<Position> _getCurrentLocationFuture;
  bool isInitialized = false;

  final List<Map<String, dynamic>> categories = [
    {'name': 'All Items', 'icon': Icons.category},
    {'name': 'Clothing', 'icon': Icons.checkroom},
    {'name': 'Electronics', 'icon': Icons.devices},
    {'name': 'Furniture', 'icon': Icons.chair},
    {'name': 'Services', 'icon': Icons.miscellaneous_services},
    {'name': 'Personal Items', 'icon': Icons.person},
    {'name': 'Other', 'icon': Icons.more_horiz},
  ];

  Future<Position> _getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print("Failed to get location: $e");
      return Future.error(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocationFuture = _getCurrentLocation();
    isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final iconSize = screenHeight * 0.05;

    return Scaffold(
      body: FutureBuilder<Position>(
        future: _getCurrentLocationFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Position currentPosition = snapshot.data!;
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwItems(context),
                  ),
                  child: SizedBox(
                    height: screenHeight * 0.1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category['name'];
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    category['icon'],
                                    color: selectedCategory == category['name']
                                        ? Colors.black
                                        : Colors.grey,
                                    size: iconSize,
                                  ),
                                  SizedBox(height: screenHeight * 0.01), // Space between icon and text
                                  Text(
                                    textAlign: TextAlign.center,
                                      category['name'],
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: TSizes.fontSizeSm(context), // fixed font size
                                        color: selectedCategory == category['name']
                                            ? Colors.black
                                            : Colors.grey,
                                        fontWeight: selectedCategory == category['name']
                                            ? FontWeight.bold
                                            : FontWeight.normal,

                                    ),
                                  ),
                                ],
                              ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: (selectedCategory == 'All Items')
                        ? FirebaseFirestore.instance
                        .collection("UserPosts")
                        .orderBy("Timestamp", descending: true)
                        .snapshots()
                        : FirebaseFirestore.instance
                        .collection("UserPosts")
                        .where("Category", isEqualTo: selectedCategory)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Center(child: Text('Error'));
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('No posts found'));
                      }

                      final docs = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          final post = docs[index];
                          String postId = post.id;
                          final imageUrls = List<String>.from(post['ImageUrls']);
                          return TPost(
                            user: post['UserName'],
                            description: post['Description'],
                            title: post['Title'],
                            imageUrls: imageUrls,
                            userPosition: currentPosition,
                            postPosition: post['Location'],
                            postID: postId,
                            userId: post['UserId'],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
