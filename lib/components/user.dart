import 'package:flutter/cupertino.dart';

class UserResponsePost extends StatelessWidget {
  const UserResponsePost({super.key, required this.title, required this.description, required this.user});
  // final List<FileImage> pictures;
  final String title;
  final String description;
  final String user;
  // final String time;



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(title),
            Text(description),
            Text(user),
          ],
        )
      ],
    );
  }
}
