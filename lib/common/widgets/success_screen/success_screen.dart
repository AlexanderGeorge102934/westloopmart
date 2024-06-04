import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:startup_app/common/styles/spacing_styles.dart';
import 'package:startup_app/features/authentication/screens/login/login.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///TItle & SubTitle
              Text(TTexts.yourAccountCreatedTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.yourAccountCreatedSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections),
              ///Buttons
              ///
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(()=> const LoginScreen()), child: const Text(TTexts.tContinue))), // TODO Implement on pressed

            ],
          ),
        ),
      ),
    );
  }
}
