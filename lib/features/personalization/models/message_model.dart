import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String senderId;
  // final String senderUserName;
  // final String receiverUserName;
  final String receiverId;
  final String chatId;
  final DateTime timestamp;

  MessageModel({
    required this.message,
    required this.senderId,
    required this.chatId,
    required this.timestamp,
    required this.receiverId,
    // required this.senderUserName,

  });

  // Convert MessageModel to a map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'Message': message,
      'SenderId': senderId,
      // 'SenderUserName': senderUserName,
      'ChatId': chatId,
      'Timestamp': timestamp,
      'ReceiverId': receiverId,
    };
  }

  // Factory constructor to create a MessageModel instance from Firestore document snapshot
  factory MessageModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return MessageModel(
      message: data['Text'],
      senderId: data['SenderId'],
      chatId: data['ChatId'],
      timestamp: data['Timestamp'],
      receiverId: data['ReceiverId'],
      // senderUserName: data['SenderUserName'],
    );
  }
}