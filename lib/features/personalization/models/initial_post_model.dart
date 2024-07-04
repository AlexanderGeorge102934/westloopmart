import 'package:cloud_firestore/cloud_firestore.dart';

class InitialPostModel {
  final String userId;
  final String userName;
  final String title;
  final String description;
  final String category;
  final List<String> imageUrls;
  final Timestamp timestamp;
  final GeoPoint location; // Assuming you need to store location

  InitialPostModel({
    required this.userId,
    required this.userName,
    required this.title,
    required this.description,
    required this.category,
    required this.imageUrls,
    required this.timestamp,
    required this.location,
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
    };
  }

  factory InitialPostModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return InitialPostModel(
      userId: data['UserId'],
      userName: data['UserName'],
      title: data['Title'],
      description: data['Description'] ?? '',
      category: data['Category'],
      imageUrls: List<String>.from(data['ImageUrls']),
      timestamp: data['Timestamp'] ?? Timestamp.now(),
      location: data['Location'] ?? const GeoPoint(0, 0), ///TODO change
    );
  }
}
