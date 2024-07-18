import 'package:flutter/material.dart';

class TEngagmentBarForOwner extends StatelessWidget {
  const TEngagmentBarForOwner({
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
    return Row(

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              /// Name
              Text(user,
                style: Theme.of(context).textTheme.bodySmall,
              ),

              /// Distance
              Text(distanceString,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              CircleAvatar(radius: 30,child: IconButton(onPressed: (){}, icon: const Icon(Icons.close)),),
              SizedBox(width: 8.0),
              CircleAvatar(radius: 30,child: IconButton(onPressed: (){}, icon: const Icon(Icons.check)),)
            ],
          )
        ],
    );
  }
}
