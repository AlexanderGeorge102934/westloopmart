import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:startup_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:startup_app/features/authentication/screens/sign_up/create_account.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          /// Email
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.email),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Password
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.password),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields/2),

          /// Remember Me and Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember Me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value){}),
                  const Text(TTexts.rememberMe),
                ],
              ),

              /// Forgot Password
              TextButton(onPressed: ()=> Get.to(()=> const ForgetPassword()), child: const Text(TTexts.forgotPassword),)
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          ///Sign In Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text(TTexts.signIn))),
          const SizedBox(height: TSizes.spaceBtwItems),
          ///Create Account Button
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: ()=> Get.to(()=> const CreateAccountScreen()), child: Text(TTexts.createAccount))),

        ],
      ),
    ),
    );
  }
}