import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:startup_app/features/authentication/controllers/sign_up/create_account_controller.dart';
import 'package:startup_app/features/authentication/screens/sign_up/Widgets/terms_and_conditions.dart';
import 'package:startup_app/features/authentication/screens/sign_up/verify_email.dart';
import 'package:startup_app/validators/validation.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/formatters/phone_number_input_formatter.dart';

class TCreateAccountForm extends StatelessWidget {
  const TCreateAccountForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateAccountController()); // Create instance
    return Form(
      key: controller.signupFormKey,
      child:Column(
      children: [

        ///First and Last Name
        Row(
          children: [
            ///First Name
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator: (value) => TValidator.validateEmptyText('First name', value),
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.firstName),

              ),
            ),
            SizedBox(width: TSizes.spaceBtwInputFields(context)),
            ///Last Name
            Expanded(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value) => TValidator.validateEmptyText('Last name', value),
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.lastName),
              ),
            ),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwInputFields(context)),

        ///Username
        TextFormField(
          controller: controller.username,
          validator: (value) => TValidator.validateEmptyText('Username', value),
          decoration: const InputDecoration(labelText: TTexts.userName),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields(context)),

        /// Email
        TextFormField(
          controller: controller.email,
          validator: (value) => TValidator.validateEmail(value),
          decoration: const InputDecoration(labelText: TTexts.email),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields(context)),

        ///Phone Number
        TextFormField(
          controller: controller.phoneNumber,
          validator: (value) => TValidator.validatePhoneNumber(value),
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(labelText: TTexts.phoneNumber),
          inputFormatters: [PhoneNumberFormatter()],

        ),
        SizedBox(height: TSizes.spaceBtwInputFields(context)),

        ///Password
        Obx( //Observer that only observes this widget and can change it even though in a stlss widget
          () => TextFormField(
            controller: controller.password,
            validator: (value) => TValidator.validatePassword(value),
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
        SizedBox(height: TSizes.defaultSpace(context)),

        TermsConditions(dark: dark),

        SizedBox(height: TSizes.defaultSpace(context)),

        ///Create Account Button
        SizedBox(width: double.infinity, child: OutlinedButton(
            onPressed: () => controller.createAccount(context),
            child: const Text(TTexts.createAccount))), // TODO Implement on pressed
      ],
    ),
    );
  }
}

