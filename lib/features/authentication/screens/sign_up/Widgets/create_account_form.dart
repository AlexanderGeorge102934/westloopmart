import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:startup_app/features/authentication/screens/sign_up/verify_email.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class TCreateAccountForm extends StatelessWidget {
  const TCreateAccountForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(child:Column(
      children: [

        ///First and Last Name
        Row(
          children: [
            ///First Name
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.firstName),

              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),
            ///Last Name
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.lastName),
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        ///Username
        TextFormField(
          decoration: const InputDecoration(labelText: TTexts.userName),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        /// Email
        TextFormField(
          decoration: const InputDecoration(labelText: TTexts.email),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        ///Phone Number
        TextFormField(
          decoration: const InputDecoration(labelText: TTexts.phoneNumber),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        ///Password
        TextFormField(
          decoration: const InputDecoration(labelText: TTexts.password),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        Row(

          children: [
            SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value){},)),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text.rich(TextSpan(
                children: [
                  ///I agree to
                  TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                  ///Privacy Policy
                  TextSpan(text: '${TTexts.privacyPolicy}', style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white: TColors.black, decoration: TextDecoration.underline, decorationColor: dark ? TColors.white: TColors.primary),
                  ),
                  /// and
                  TextSpan(text: ' and ', style: Theme.of(context).textTheme.bodySmall),
                  ///Terms of Use
                  TextSpan(text: TTexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white: TColors.black, decoration: TextDecoration.underline, decorationColor: dark ? TColors.white: TColors.primary),
                  ),
                ]
            ),
            ),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwSections),

        ///Create Account Button
        SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(()=> const VerifyEmailScreen()), child: const Text(TTexts.createAccount))), // TODO Implement on pressed
      ],
    ),
    );
  }
}