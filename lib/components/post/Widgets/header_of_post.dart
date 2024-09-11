import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

/// --- Header of Post --- ///
class THeaderOfPost extends StatelessWidget {
  const THeaderOfPost({
    super.key,
    required this.user,
  });

  final String user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems(context), horizontal: TSizes.spaceBtwItems(context) ),
      child: Row(
        children: [
          const CircleAvatar(),
          const SizedBox(width: 10),
          Text(
            user,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}