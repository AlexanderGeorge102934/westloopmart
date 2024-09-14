import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../add_post/add_post_screen.dart';

/// --- Add Post Button --- ///
class TAddPostButton extends StatelessWidget {
  const TAddPostButton({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        Get.to(()=> AddPostScreen());
      },
      backgroundColor: dark ? TColors.white : Colors.black,
      foregroundColor: dark ? Colors.black : TColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      elevation: 0,
      tooltip: 'Increment',
      child: const Icon(Icons.add),

    );
  }
}