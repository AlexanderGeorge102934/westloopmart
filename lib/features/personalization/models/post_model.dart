import 'package:cloud_firestore/cloud_firestore.dart';

/// --- Post Model --- ///
class PostModel {
  final String userId;
  final String userName;
  final String title;
  final String description;
  final String category;
  final List<String> imageUrls;
  final Timestamp timestamp;
  final GeoPoint location; // Assuming you need to store location
  final String status;
  final String chatId;

  PostModel({
    required this.userId,
    required this.status,
    required this.userName,
    required this.title,
    required this.description,
    required this.category,
    required this.imageUrls,
    required this.timestamp,
    required this.location,
    required this.chatId,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'UserName': userName,
      'Title': title,
      'Description': description,
      'Category': category,
      'ImageUrls': imageUrls,
      'Timestamp': timestamp,
      'Location': location,
      'Status': status,
      'ChatId': chatId
    };
  }


  factory PostModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PostModel(
      userId: data['UserId'],
      userName: data['UserName'],
      title: data['Title'],
      description: data['Description'] ?? '',
      category: data['Category'],
      imageUrls: List<String>.from(data['ImageUrls']),
      timestamp: data['Timestamp'],
      location: data['Location'],
      status: data['Status'],
      chatId: data['ChatId']
    );
  }
}
