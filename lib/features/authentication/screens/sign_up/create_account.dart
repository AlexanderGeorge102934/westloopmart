import 'package:flutter/material.dart';
import 'package:startup_app/features/authentication/screens/sign_up/Widgets/create_account_header.dart';
import 'package:startup_app/helpers/helpers.dart';
import 'package:startup_app/utils/constants/sizes.dart';

import 'Widgets/create_account_form.dart';


/// Create Account Screen
class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(
        color: dark ? Colors.white : Colors.black, // Change color based on dark mode
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace(context)),
          child: Column(
            children: [

              ///Title
              const TCreateAccountHeader(),

              ///Form
              TCreateAccountForm(dark: dark),
              SizedBox(height: TSizes.spaceBtwSections(context),),

            ],
          ),
        ),
      ),
    );
  }
}











