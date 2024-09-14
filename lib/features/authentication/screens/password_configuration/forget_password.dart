import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:startup_app/helpers/helpers.dart';
import 'package:startup_app/utils/constants/texts.dart';
import 'package:startup_app/validators/validation.dart';

import '../../../../utils/constants/sizes.dart';


/// --- Forget Password Screen --- ///
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(
        color: dark ? Colors.white : Colors.black, // Change color based on dark mode
      ),),
      body: Padding(padding:EdgeInsets.all(TSizes.defaultSpace(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Heading
              Text(TTexts.forgotPassword, style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: TSizes.spaceBtwItems(context)),
              Text(TTexts.forgotPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: TSizes.spaceBtwSections(context)),

              /// Email
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  decoration: const InputDecoration(labelText: TTexts.email),
                  validator: TValidator.validateEmail,
                ),
              ),
              SizedBox(height: TSizes.spaceBtwInputFields(context)),

              /// Submit Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text(TTexts.submit))), //TODO Have the button send an email

            ],
          )),


    );
  }
}
