import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/common/styles/spacing_styles.dart';
import 'package:startup_app/common/widgets/form_divider.dart';
import 'package:startup_app/features/authentication/screens/sign_up/Widgets/create_account_header.dart';
import 'package:startup_app/helpers/helpers.dart';
import 'package:startup_app/utils/constants/colors.dart';
import 'package:startup_app/utils/constants/image_strings.dart';
import 'package:startup_app/utils/constants/sizes.dart';
import 'package:startup_app/utils/constants/texts.dart';

import '../../../../common/widgets/social_buttons.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Title
              const TCreateAccountHeader(),

              ///Form
              Form(child:Column(
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
                            TextSpan(text: '${TTexts.termsOfUse}', style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: dark ? TColors.white: TColors.black, decoration: TextDecoration.underline, decorationColor: dark ? TColors.white: TColors.primary),
                            ),
                          ]
                      ),
                      ),
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///Create Account Button
                  SizedBox(width: double.infinity, child: OutlinedButton(onPressed: (){}, child: Text(TTexts.createAccount))),
                ],


              ),

              )
            ],
          ),
        ),
      ),
    );
  }
}









