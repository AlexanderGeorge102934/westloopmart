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
import 'Widgets/create_account_form.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(
        color: dark ? Colors.white : Colors.black, // Change color based on dark mode
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Title
              const TCreateAccountHeader(),

              ///Form
              TCreateAccountForm(dark: dark),
              const SizedBox(height: TSizes.spaceBtwSections,),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections,),

              ///Footer
              const TSocialButtons()


            ],
          ),
        ),
      ),
    );
  }
}











