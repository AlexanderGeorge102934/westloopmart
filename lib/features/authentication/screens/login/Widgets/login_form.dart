import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:startup_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:startup_app/features/authentication/screens/sign_up/create_account.dart';
import 'package:startup_app/features/authentication/screens/trade_main/offers_trade.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Padding(
      padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections(context)),
      child: Column(
        children: [
          /// Email
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.email),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields(context)),

          ///Password
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.password),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields(context)/2),

          /// Remember Me and Forget Password
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember Me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value){}),
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(TTexts.rememberMe,
                          style: TextStyle(fontSize: TSizes.fontSizeLg(context)))),
                ],
              ),

              /// Forgot Password
              FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: TextButton(onPressed: ()=> Get.to(()=> const ForgetPassword()),
                      child: Text(TTexts.forgotPassword, style: TextStyle(fontSize: TSizes.fontSizeLg(context)))))
            ],
          ),
          SizedBox(height: TSizes.spaceBtwItems(context)),

          ///Sign In Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>Get.to(()=> const OffersScreen()), child: const Text(TTexts.signIn))),
          SizedBox(height: TSizes.spaceBtwItems(context)),
          ///Create Account Button
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: ()=> Get.to(()=> const CreateAccountScreen()), child: const Text(TTexts.createAccount))),

        ],
      ),
    ),
    );
  }
}