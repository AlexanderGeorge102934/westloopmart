import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:startup_app/components/user.dart';
import 'package:startup_app/utils/constants/colors.dart';
import 'package:startup_app/utils/constants/image_strings.dart';

import '../../../../helpers/helpers.dart';
import '../../../../utils/constants/sizes.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
        color: dark ? TColors.white : TColors.black, // Change color based on dark mode
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("User Posts").orderBy("Time Stamp", descending: false).snapshots(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return ListView.builder(itemCount: snapshot.data!.docs.length, itemBuilder: (context, index) {

                    // Get the message
                    final post = snapshot.data!.docs[index];
                    return UserResponsePost(title: post["Title"], description: post["Description"], user: post["User"]);
                  });
                }
                else if(snapshot.hasError){
                  return Center(child: Text('Error ${snapshot.error}'));
                }

                return const Center(child: CircularProgressIndicator());
              },
            )
          ),
        ],
      )
      ///Scrollable content




    );
  }
}

class PostBuilder extends StatelessWidget {
  const PostBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(11),

          /// Image, Subtitle
          child: SizedBox(
              height: 430,


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
                    height: 350, // Adjust height as needed
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
                      Text("Product",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),

                      ///Name
                      Text("Offered by Blank",
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
    );
  }
}
