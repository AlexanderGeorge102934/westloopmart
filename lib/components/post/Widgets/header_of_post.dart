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
      padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems(context), horizontal: MediaQuery.of(context).size.width * 0.005 ),
      child: Row(
        children: [
          const CircleAvatar(),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
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