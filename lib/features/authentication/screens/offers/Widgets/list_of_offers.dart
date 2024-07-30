import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../components/offer/offer.dart';

class TListOfOffers extends StatelessWidget {
  const TListOfOffers({
    super.key,
    required this.postID,
    required this.auth,
    required this.userId,
    required this.userPosition,
  });

  final String postID;
  final FirebaseAuth auth;
  final String userId;
  final Position userPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('UserPosts').doc(postID).collection('Offers').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No offers yet!'));
                }
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final offer = docs[index];
                    final imageUrls = List<String>.from(offer['ImageUrls']);
                    bool ownerOfPost = false;
                    if (auth.currentUser != null && auth.currentUser!.uid == userId){
                      ownerOfPost = true;
                    }
                    else{
                      ownerOfPost = false;
                    }
                    return TOffer(
                      title: offer['Title'],
                      postPosition: offer['Location'],
                      description: offer['Description'],
                      imageUrls: imageUrls,
                      user: offer['UserName'],
                      userPosition: userPosition,
                      userIdOfOffer: offer['UserId'],
                      ownerOfPost: ownerOfPost,
                      statusOfOffer: offer['Status'],
                      offerId: offer.id,
                      postId: offer['PostId'],
                    );
                  },
                );
              },
            )
        ),
      ],
    );
  }
}