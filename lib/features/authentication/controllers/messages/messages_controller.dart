import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:startup_app/data/messages/messages_repository.dart';

import '../../../../helpers/network_manager.dart';
import '../../../../utils/ui/loader.dart';
import '../../../personalization/models/message_model.dart';

class MessagesController extends GetxController {

  static MessagesController get instance => Get.find();
  final message = TextEditingController();

  Future<String?> createChat(String userId1, String userId2, String offerId, String postId) async {
    final MessagesRepository messagesRepository = Get.put(MessagesRepository());
    try {
      final chatId = await messagesRepository.createChat(userId1, userId2);
      // Ensure both Offer and Post documents are updated atomically
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      await firestore.runTransaction((transaction) async {
        // Reference to the Offer document
        final offerDocRef = firestore.collection("Offers").doc(offerId);

        // Reference to the Post document
        final postDocRef = firestore.collection("UserPosts").doc(postId);

        // Update Offer document
        transaction.update(offerDocRef, {
          'ChatId': chatId,
          'Status': 'On Going',
        });

        // Update Post document
        transaction.update(postDocRef, {
          'ChatId': chatId,
          'Status': 'On Going',
        });
      });

      return chatId;
    } catch (e){
      TLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
    return null;
  }


  Future<void> sendMessage(String text, String chatId, String senderId, String receiverId) async { /// Todo make a chat id unique to every offer and it gets deleted everytime it's finished
    final MessagesRepository messagesRepository = Get.put(MessagesRepository());
    final user = await messagesRepository.getCurrentUser();

    /// Check user is logged in
    if (user == null) {
      TLoader.errorSnackBar(title: "User not logged in", message: "Please log in to post an offer."); // todo change it so once you click the add button you immediantly go to the login
      return;
    }

    try{

      /// Check connection (Needs to be changed to just send and if it doesn't send then just say not delivered)
      final isConnected = await NetworkManager.instance.isConnected(); //TODO needs to be how messages work where it just says not delivered
      if (!isConnected) {
        TLoader.errorSnackBar(title: "No Internet", message: "Please check your internet connection.");
        return;
      }

      /// Create message model
      if (message.text.isNotEmpty) {
        final messsage = MessageModel(
          message: text,
          senderId: senderId,
          receiverId: receiverId,
          chatId: chatId,
          timestamp: DateTime.now(),
        );

        /// Send message
        await messagesRepository.sendMessage(messsage, chatId);

        /// Clear message
        message.clear(); //Todo make this go away as soon as it's sent
      }
    } catch (e){
      TLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
