import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/personalization/models/offer_model.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';

/// --- Offers Repository --- ///
class OffersRepository extends GetxController {
  static OffersRepository get instance => Get.find();

  /// Function to save user data to Firestore
  Future<void> addOffer(String postId, OfferModel offer, String userId) async {
    try{
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentReference offerRef = await FirebaseFirestore.instance.collection("Offers").add(offer.toJson());
        String offerId = offerRef.id;
        await FirebaseFirestore.instance.collection("Users").doc(userId).collection("Offers").doc(offerId).set({"OfferId": offerId});
      });
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

  /// Function to retrieve offer from Firestore
  Future<DocumentSnapshot> retrieveOffer(String offerId) async {
    try{
      return await FirebaseFirestore.instance.collection("Offers").doc(offerId).get();
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

  /// Function to update offer in Firestore
  Future<void> updateOffer(String offerId, String status) async {

    try{

      await FirebaseFirestore.instance.collection("Offers").doc(offerId).update({'Status': status});
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
}
