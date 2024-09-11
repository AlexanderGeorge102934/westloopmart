import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:startup_app/features/personalization/models/message_model.dart';

import '../../utils/exceptions/firebase_exception.dart';
import '../../utils/exceptions/format_exception.dart';
import '../../utils/exceptions/platform_exception.dart';

/// --- Messages Repository --- ///
class MessagesRepository extends GetxController{
  static MessagesRepository get instance => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Get current user
  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<String> createChat(String userId1, String userId2) async {
    try {
      final chatRef = FirebaseFirestore.instance.collection('Chats').doc();
      await chatRef.set({'Users': [userId1, userId2]}); ///TODO security rules
      return chatRef.id;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message; //TODO make sure all messages are checked and good (Didn't take time checking)
    } on FormatException catch (_){
      throw const TFormatException(); //TODO make sure all messages are checked and good (Didn't take time checking)
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; //TODO make sure all messages are checked and good (Didn't take time checking)
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }

  }

  /// Function to save user data to Firestore
  Future<void> sendMessage(MessageModel message, String chatId) async {
    try{
      await FirebaseFirestore.instance.collection('Chats').doc(chatId).collection('Messages').add(message.toJson());

    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message; //TODO make sure all messages are checked and good (Didn't take time checking)
    } on FormatException catch (_){
      throw const TFormatException(); //TODO make sure all messages are checked and good (Didn't take time checking)
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; //TODO make sure all messages are checked and good (Didn't take time checking)
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  //
  // Future<List<Message>> getMessagesForChat(String chatId) async {
  //   try {
  //     final messagesRef = FirebaseFirestore.instance.collection('Chats').doc(chatId).collection('Messages');
  //     final messagesQuery = messagesRef.orderBy('timestamp', descending: true);
  //     final messagesSnapshot = await messagesQuery.get();
  //     return messagesSnapshot.docs.map((doc) => Message.fromMap(doc.data())).toList();
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }


}