import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../components/post/post.dart';
import '../login/login.dart';

class UserProfileScreen extends StatelessWidget {
  final User? user;

  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAll(() => const LoginScreen());
            },
            child: const Text(
              "Sign Out",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            _buildPostsGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              user?.photoURL ??
                  'https://via.placeholder.com/150', // Placeholder if no profile image
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.displayName ?? 'Username',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                user?.email ?? 'Email not available',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPostsGrid(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('UserPosts')
          .where('UserId', isEqualTo: user?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error fetching posts'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No posts yet'));
        }

        final posts = snapshot.data!.docs;

        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: posts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            final post = posts[index];
            final imageUrls = List<String>.from(post['ImageUrls']);

            return GestureDetector(
              onTap: () async {
                // Get the current position asynchronously
                final userPosition = await _getCurrentPosition();

                // Show the TPost widget in a modal bottom sheet
                showModalBottomSheet(

                  context: context,
                  isScrollControlled: true,
                  builder: (context) => Container(
                    height: MediaQuery.of(context).size.height,
                    child: TPost(
                      user: post['UserName'],
                      description: post['Description'],
                      title: post['Title'],
                      imageUrls: imageUrls,
                      userPosition: userPosition,
                      postPosition: post['Location'],
                      postID: post.id,
                      userId: user?.uid ?? '',
                    ),
                  ),
                );
              },
              child: Image.network(
                imageUrls.isNotEmpty ? imageUrls[0] : 'https://via.placeholder.com/150',
                fit: BoxFit.cover,
              ),
            );
          },
        );
      },
    );
  }

  Future<Position> _getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
