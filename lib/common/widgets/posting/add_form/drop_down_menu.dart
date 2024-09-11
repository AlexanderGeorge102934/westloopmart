import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../features/authentication/controllers/add_post_offer/add_post_offer_controller.dart';
import '../../../../utils/constants/sizes.dart';


/// Description of Add Form
class TAddFormDropDownMenu extends StatelessWidget {
  const TAddFormDropDownMenu({
    super.key,
    required this.postingController,
  });

  final PostingController postingController;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: postingController.category.value.isEmpty
          ? null
          : postingController.category.value,
      decoration: InputDecoration(
        hintText: "Category",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
          borderSide: BorderSide(
            color: Colors.blueAccent,
          ),
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: TSizes.fontSizeLg(context),
        ),
      ),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: TSizes.fontSizeLg(context),
        color: Colors.black,
      ),
      icon: const Icon(Icons.arrow_drop_down, color: Colors.black), // Customize the dropdown icon
      iconSize: 24, // TODO make dynamic Adjust icon size if necessary
      isExpanded: true, // Ensures the dropdown field uses full width and aligns text properly
      alignment: Alignment.centerLeft,
      items: [
        'Electronics',
        'Furniture',
        'Clothing',
        'Personal Items',
        'Services',
        'Other',
      ].map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(category),
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        postingController.category.value = newValue!;
      },
    );
  }
}