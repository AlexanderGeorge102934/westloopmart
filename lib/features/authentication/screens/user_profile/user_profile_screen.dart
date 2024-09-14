import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:startup_app/features/authentication/screens/menu/menu_screen.dart';
import '../../../../components/post/post.dart';
import '../../../../utils/constants/sizes.dart';
import 'Widgets/profile_header.dart';

/// --- User Profile Screen --- ///
class UserProfileScreen extends StatelessWidget {
  final User? user;

  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// App bar title and setting icon
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: TSizes.fontSizeXXXl(context),
            fontWeight: FontWeight.normal,
          ),

        ),

        actions: [
          IconButton(onPressed: () => Get.to(() => const MenuScreen()), icon: const Icon(Icons.menu, size: TSizes.imageThumbSize * 0.4, ))
        ],
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Profile Header
            TProfileHeader(user: user),

            /// Post grid
            _buildPostsGrid(context),
          ],
        ),
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
                imageUrls.isNotEmpty ? imageUrls[0] : 'https://via.placeholder.com/150', //Todo get rid of placeholder
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

