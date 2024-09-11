import 'package:flutter/material.dart';

/// --- Engagement Bar --- ///
class TEngagementBar extends StatelessWidget {
  const TEngagementBar({
    super.key,
    required this.title,
    required this.user,
    required this.distanceString,
  });

  final String title;
  final String user;
  final String distanceString;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Text(title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),

        /// Name
        Text('by $user',
          style: Theme.of(context).textTheme.bodySmall,
        ),

        /// Distance
        Text(distanceString,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}