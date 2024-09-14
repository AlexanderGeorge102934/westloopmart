import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../helpers/helpers.dart';
import 'Widgets/list_of_offers.dart';


/// --- Offers Screen --- ///
class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key, required this.postID, required this.userPosition, required this.userId});

  final String postID;
  final Position userPosition;
  final String userId;


  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Offers'), iconTheme: IconThemeData(
        color: dark ? Colors.white : Colors.black, // Change color based on dark mode
        )
      ),

      body: TListOfOffers(postID: postID, auth: auth, userId: userId, userPosition: userPosition),
    );
  }
}


