import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_app/features/authentication/screens/trades/my_offers_screen.dart';
import 'package:startup_app/features/authentication/screens/trades/my_posts_screen.dart';

class TradesScreen extends StatelessWidget {
  TradesScreen({super.key});
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const PageScrollPhysics(), // Add this line to enable smooth scrolling
        children: [
          MyOffersScreen(user: user,),
          MyPostsScreen(user: user),
        ],
      ),
    );
  }
}