import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/features/authentication/screens/login/login.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../controllers/forgot_password/forgot_password_controller.dart';


/// Reset Password Screen
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

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

                /// Title & SubTitle
                Text(TTexts.passwordEmailSentTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                SizedBox(height: TSizes.spaceBtwItems(context)),
                Text(TTexts.passwordEmailSentSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
                SizedBox(height: TSizes.spaceBtwSections(context)),

                /// Done
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.offAll(()=> const LoginScreen()), child: const Text(TTexts.done))),
                SizedBox(height: TSizes.spaceBtwItems(context)),

                /// Resend Password
                TextButton(onPressed: () => ForgotPasswordController.instance.resendPasswordResetEmail(email), child: const Text(TTexts.resendEmail),)// TODO Implement on pressed to send an email

              ],
            ),
        ),

      ),
    );
  }
}
