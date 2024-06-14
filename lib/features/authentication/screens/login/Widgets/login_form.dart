import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:startup_app/features/authentication/controllers/login/login_controller.dart';
import 'package:startup_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:startup_app/features/authentication/screens/sign_up/create_account.dart';
import 'package:startup_app/features/authentication/screens/trade_main/offers_trade.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(child: Padding(
      key: controller.loginFormKey,
      padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections(context)),
      child: Column(
        children: [

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(labelText: TTexts.email),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields(context)),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validateEmptyText('Password' , value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
                  )
              ),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections(context)),


          ///Sign In Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> controller.emailAndPasswordSignIn(context), child: const Text(TTexts.signIn))),
          SizedBox(height: TSizes.spaceBtwItems(context)),


          ///Create Account Button
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: ()=> Get.to(()=> const CreateAccountScreen()), child: const Text(TTexts.createAccount))),
          SizedBox(height: TSizes.spaceBtwItems(context)),


          /// Forget Password
          TextButton(
              onPressed: ()=> Get.to(()=> const ForgetPassword()),
              child: Text(TTexts.forgotPassword, style: TextStyle(fontSize: TSizes.fontSizeMd(context))))
        ],
      ),
    ),
    );
  }
}
