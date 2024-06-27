import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/image_strings.dart';
import '../utils/constants/sizes.dart';

class Offer extends StatelessWidget {
  const Offer({super.key, required this.user, required this.description, required this.title});

  final String user;
  // final String time;
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11),

      /// Image, Subtitle
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// Image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.md(context)),
                color: Colors.red,
              ),
              child: Image.asset(
                TImages.google,
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: TSizes.spaceBtwItems(context)),

            ///Subtitle (Offered product and Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                ///Product
                children: [
                  Text(title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  ///Name
                  Text("Offered by $user",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
