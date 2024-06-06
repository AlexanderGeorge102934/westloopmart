import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:startup_app/features/authentication/screens/login/login.dart';
import 'package:startup_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:startup_app/helpers/helpers.dart';
import 'package:startup_app/utils/constants/texts.dart';

import '../../../../utils/constants/sizes.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword ({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(
        color: dark ? Colors.white : Colors.black, // Change color based on dark mode
      ),),
      body: Padding(padding:EdgeInsets.all(TSizes.defaultSpace(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Heading
              Text(TTexts.forgotPassword, style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: TSizes.spaceBtwItems(context)),
              Text(TTexts.forgotPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: TSizes.spaceBtwSections(context)),
              /// Email
              TextFormField(
                decoration: const InputDecoration(labelText: TTexts.email),
              ),
              SizedBox(height: TSizes.spaceBtwInputFields(context)),
              ///Submit button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(()=> const ResetPassword()), child: const Text(TTexts.submit))), //TODO Have the button send an email

            ],
          )),


    );
  }
}
