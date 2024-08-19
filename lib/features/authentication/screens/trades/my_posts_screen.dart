import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../components/my_post/my_post.dart';
import '../../../../components/post/post.dart';
import '../../../../components/trades/trades.dart';
import '../../../../helpers/helpers.dart';

class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({super.key, required this.user});

  final User? user;

  Future<List<DocumentSnapshot>> _fetchPosts(List<String> ids) async {
    final posts = await FirebaseFirestore.instance.collection("UserPosts").where(FieldPath.documentId, whereIn: ids).get();
    return posts.docs;
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Posts"),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(user?.uid)
            .collection("Posts")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No data has been found!')); /// Todo change with a screen that says no posts made yet
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('You have not made any posts yet!')); /// Todo change with a screen that says no posts made yet
          }

          final ids = snapshot.data!.docs.map((doc) => doc.id).toList();

          return FutureBuilder<List<DocumentSnapshot>>(
            future: _fetchPosts(ids),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Error'));
              }
              if (!snapshot.hasData) {
                return const Center(child: Text('No data has been found!')); /// Todo change with a screen that says no posts made yet
              }

              if (snapshot.data!.isEmpty) {
                return const Center(child: Text('You have not made any posts yet!')); /// Todo change with a screen that says no posts made yet
              }

              final docs = snapshot.data!;
              final groupedDocs = groupBy(docs, (doc) => doc['Status']);
              final sortedKeys = ['On Going', 'Accepted', 'Posted'];

              final List<Widget> items = [];

              for (var key in sortedKeys) {
                if (groupedDocs.containsKey(key)) {
                  items.add(Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      key,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ));
                  items.addAll(groupedDocs[key]!.map((post) {
                    final imageUrls = List<String>.from(post['ImageUrls']);
                    final postId = post.id;
                    return ListTile(

                      subtitle: TMyPost(
                        user: post['UserName'],
                        userId: post['UserId'],
                        chatId: post['ChatId'],
                        title: post['Title'],
                        postId: postId,
                        imageUrls: imageUrls,
                        status: post['Status'],
                      ),
                    );
                  }).toList());
                }
              }

              return ListView(
                children: items,
              );
            },
          );
        },
      ),
    );
  }
}