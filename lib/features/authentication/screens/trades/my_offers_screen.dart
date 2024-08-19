import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:startup_app/components/trades/trades.dart';
import 'package:startup_app/helpers/helpers.dart';

class MyOffersScreen extends StatelessWidget {
  const MyOffersScreen({super.key, required this.user});

  final User? user;

  Future<List<DocumentSnapshot>> _fetchPosts(List<String> ids) async {
    final posts = await FirebaseFirestore.instance.collection("Offers").where(FieldPath.documentId, whereIn: ids).get();
    return posts.docs;
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Offers"),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(user?.uid)
            .collection("Offers")
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
            return const Center(child: Text('You have not made any offers yet!')); /// Todo change with a screen that says no posts made yet
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
                return const Center(child: Text('You have not made any offers yet!')); /// Todo change with a screen that says no posts made yet
              }

              final docs = snapshot.data!;
              final groupedDocs = groupBy(docs, (doc) => doc['Status']);
              final sortedKeys = ['On Going', 'Accepted', 'Offered', 'On Hold', 'Denied'];

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
                  items.addAll(groupedDocs[key]!.map((offer) {
                    final imageUrls = List<String>.from(offer['ImageUrls']);
                    final offerId = offer.id;
                    return ListTile(

                      subtitle: TTrades(
                        titleOfPost: offer['TitleOfPost'],
                        userOfPost: offer['UserNameOfPost'],
                        imageUrls: imageUrls,
                        titleOfOffer: offer['Title'],
                        statusOfOffer: offer['Status'],
                        userId1: offer['UserId'],
                        userId2: offer['UserOfPostId'],
                        chatId: offer['ChatId'],
                        offerId: offerId,
                        postId: offer['PostId'],
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