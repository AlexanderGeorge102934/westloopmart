import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:startup_app/utils/formatters/formatter.dart';

/// --- User Model --- ///
class UserModel {

  // Keep values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  String username;
  final String email;
  final String phoneNumber;
  String profilePicture;

  //
  UserModel({
    required this.id,
    required this.phoneNumber,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profilePicture
  });


  /// Helper function to get the full name
  String get fullName => '$firstName $lastName';

  /// Helper function to get the full name
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Helper function to split full name into first name, last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to create an empty user model
  static UserModel empty() => UserModel(id: '', phoneNumber: '', username: '', firstName: '', lastName: '', email: '', profilePicture: '');


  /// Convert model to JSON structure for storing data in Firsebase
  Map<String, dynamic> toJson(){
    return{
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;

      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['UserName'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    }

    return null as UserModel; // TODO FIX


  }



}