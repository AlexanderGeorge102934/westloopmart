import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:startup_app/features/authentication/controllers/login/login_controller.dart';
import 'package:startup_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:startup_app/features/authentication/screens/sign_up/create_account.dart';

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
    return Form(
      key: controller.loginFormKey,
      child: Padding(
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
            () => Column(
              children: [
                TextFormField(
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

                if (controller.errorMessage.value.isNotEmpty)
                   Column(
                     children: [
                       SizedBox(height: TSizes.spaceBtwItems(context)),
                       Text(
                          controller.errorMessage.value,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                       SizedBox(height: TSizes.spaceBtwItems(context)),
                     ],
                   ),
                if (controller.errorMessage.value.isEmpty)
                  SizedBox(height: TSizes.spaceBtwSections(context)),
              ],
            ),

          ),


          ///Sign In Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> controller.emailAndPasswordSignIn(), child: const Text(TTexts.signIn))),
          SizedBox(height: TSizes.spaceBtwItems(context)),


          ///Create Account Button
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: ()=> Get.to(()=> const CreateAccountScreen()), child: const Text(TTexts.createAccount))),
          SizedBox(height: TSizes.spaceBtwItems(context)),


          /// Forget Password
          TextButton(
              onPressed: ()=> Get.to(()=> const ForgetPasswordScreen()),
              child: Text(TTexts.forgotPassword, style: TextStyle(fontSize: TSizes.fontSizeMd(context))))
        ],
      ),
    ),
    );
  }
}
