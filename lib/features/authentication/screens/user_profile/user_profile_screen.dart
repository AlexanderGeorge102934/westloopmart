import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {


  UserProfileScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              // backgroundImage: NetworkImage(),
              radius: 50,
            ),
            SizedBox(height: 16),
            Text(
              'Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Email'),
          ],
        ),
      ),
    );
  }
}