import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../components/post/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _pageOneState();
}

class _pageOneState extends State<HomeScreen> {
  String dropdownValue = 'All Items';
  late Future<Position> _getCurrentLocationFuture;
  bool isInitialized = false;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Position>(
        future: _getCurrentLocationFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Position currentPosition = snapshot.data!;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      elevation: 0,
                      borderRadius: BorderRadius.circular(10),
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),
                      value: dropdownValue,
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'All Items',
                        'Clothing',
                        'Electronics',
                        'Furniture',
                        'Services',
                        'Personal Items',
                        'Other'
                      ].map<DropdownMenuItem<String>>((String value) {
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
                    stream: (dropdownValue == 'All Items')
                        ? FirebaseFirestore.instance
                        .collection("UserPosts")
                        .orderBy("Timestamp", descending: true)
                        .snapshots()
                        : FirebaseFirestore.instance
                        .collection("UserPosts")
                        .where("Category", isEqualTo: dropdownValue)
                        .snapshots(), // No orderBy here
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
