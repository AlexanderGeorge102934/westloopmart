import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import 'my_message.dart';
import 'other_user_message.dart';


/// --- Method to Show Chats --- ///
Expanded TChatStreamBuilder(String chatId, String userId) {
  return Expanded(
    child: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Chats')
          .doc(chatId)
          .collection('Messages')
          .orderBy('Timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: TColors.error),
            ),
          );
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:

          /// Show texts
            return ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              children: snapshot.data!.docs.map((doc) {
                return doc['SenderId'] == userId
                    ? TMyMessage(doc['Message'], context)
                    : TOtherUserMessage(doc['Message'], context);
              }).toList(),
            );
        }
      },
    ),
  );
}