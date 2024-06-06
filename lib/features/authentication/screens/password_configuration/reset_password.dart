import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:startup_app/features/authentication/screens/login/login.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace(context)),
            child: Column(
              children: [
                ///Title & SubTitle
                Text(TTexts.passwordEmailSentTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                SizedBox(height: TSizes.spaceBtwItems(context)),
                Text(TTexts.passwordEmailSentSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
                SizedBox(height: TSizes.spaceBtwSections(context)),
                ///Buttons
                ///
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(()=> const LoginScreen()), child: const Text(TTexts.done))),
                SizedBox(height: TSizes.spaceBtwItems(context)),
                TextButton(onPressed: (){}, child: const Text(TTexts.resendEmail),)// TODO Implement on pressed to send an email

              ],
            ),
        ),

      ),
    );
  }
}
