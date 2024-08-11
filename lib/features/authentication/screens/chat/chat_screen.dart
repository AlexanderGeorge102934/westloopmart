import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/messages/messages_controller.dart';

class ChatScreen extends StatelessWidget {
  final String chatId;
  final String userId;
  final String otherUserId;

  ChatScreen({super.key, required this.chatId, required this.userId, required this.otherUserId});

  final MessagesController _messagesController = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Chats')
                  .doc(chatId)
                  .collection('Messages')
                  .orderBy('Timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Text('Loading....');
                  default:
                    return ListView(
                      reverse: true,
                      children: snapshot.data!.docs.map((doc) {
                        return ListTile(
                          title: Text(doc['Message']),
                          subtitle: Text(doc['SenderId'] == userId ? 'You' : 'Other user'),
                        );
                      }).toList(),
                    );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messagesController.message,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    await _messagesController.sendMessage(
                      _messagesController.message.text,
                      chatId,
                      userId,
                      otherUserId,
                    );
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}