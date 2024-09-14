import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:startup_app/utils/constants/sizes.dart';

/// --- Profile Header --- ///
class TProfileHeader extends StatelessWidget {
  const TProfileHeader({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          
          /// Circle Avatar
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              user?.photoURL ?? 'https://via.placeholder.com/150', // Todo get rid of place holder 
            ),
          ),
          
          SizedBox(width: 20),
          
          /// Username (Currently email) 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.email ?? 'Email not available',
                style: TextStyle(
                  fontSize: TSizes.fontSizeXXl(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
