import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_app/components/offer.dart';
import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _pageOneState();
}
// we have to create a function that takes what the user inputs
// the function will take the users name location and
// in and update the List below to work dynamically.
// for now in order to make any updates we have to manually include
// all updates..

final Map<String, String> myMap = {

};
//flutter + Dart
class _pageOneState extends State<HomeScreen> {
  String dropdownValue = 'All Items';
  final _controller = PageController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                elevation: 0,
                borderRadius:  BorderRadius.circular(10),
                underline: Container(
                  height: 2,
                  color: Colors.transparent, // Underline color
                ),
                value: dropdownValue,
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['All Items', 'Clothes', 'Shoes', 'Gadgets']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),

          Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("User Posts").orderBy("TimeStamp", descending: false).snapshots(),
                builder: (context, snapshot){
                  if (snapshot.hasData){
                    return ListView.builder(itemCount: snapshot.data!.docs.length, itemBuilder: (context,index){

                      /// Get the message
                      final post = snapshot.data!.docs[index];
                      return Offer(user: post['UserName'], description: post['Description'], title: post['Title']);

                    },
                    );
                  }
                  /// If an error occured
                  else if(snapshot.hasError){
                    return Center(child: Text('Error'),);
                  }

                  /// If there is no data
                  else if(!snapshot.hasData){
                    return Center(child: Text("No data"),);
                  }

                  else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              )
          ),
          // NewWidget(controller: _controller),
        ],
      ),
    );
  }
}




