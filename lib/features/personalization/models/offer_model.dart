import 'package:cloud_firestore/cloud_firestore.dart';

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

  OfferModel({
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
    required this.userOfPost

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
      'UserNameOfPost': userOfPost
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

    );

  }
}
