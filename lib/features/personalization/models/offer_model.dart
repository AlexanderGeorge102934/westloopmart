import 'package:cloud_firestore/cloud_firestore.dart';

/// --- Offer Model --- ///
class OfferModel {
  final String userId;
  final String postId;
  final String userName;
  final String title;
  final String description;
  final String category;
  final List<String> imageUrls;
  final Timestamp timestamp;
  final String status;
  final GeoPoint location; // Assuming you need to store location
  final String titleOfPost;
  final String userOfPost;
  final String userOfPostId;
  final String? chatId;

  OfferModel( {
    this.chatId, /// Unsure about what to do for something that will become null at first
    required this.postId,
    required this.userId,
    required this.userName,
    required this.title,
    required this.description,
    required this.category,
    required this.imageUrls,
    required this.timestamp,
    required this.location,
    required this.status,
    required this.titleOfPost,
    required this.userOfPost,
    required this.userOfPostId

  });

  Map<String, dynamic> toJson() {
    return {
      'PostId': postId,
      'UserId': userId,
      'UserName': userName,
      'Title': title,
      'Description': description,
      'Category': category,
      'ImageUrls': imageUrls,
      'Timestamp': timestamp,
      'Location': location,
      'Status': status,
      'TitleOfPost': titleOfPost,
      'UserNameOfPost': userOfPost,
      'UserOfPostId': userOfPostId,
      'ChatId': ''
    };
  }


  factory OfferModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return OfferModel(
        userId: data['UserId'],
        userName: data['UserName'],
        title: data['Title'],
        description: data['Description'] ?? '',
        category: data['Category'],
        imageUrls: List<String>.from(data['ImageUrls']),
        timestamp: data['Timestamp'],
        location: data['Location'],
        postId: data['PostId'],
        status: data['Status'],
        titleOfPost: data['TitleOfPost'],
        userOfPost: data['UserNameOfPost'],
        userOfPostId: data['UserOfPostId'],
        chatId: data['ChatId']
    );

  }
}
