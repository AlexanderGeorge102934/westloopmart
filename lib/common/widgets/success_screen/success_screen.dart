import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:startup_app/common/styles/spacing_styles.dart';
import 'package:startup_app/features/authentication/screens/login/login.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.title, required this.subTitle, required this.onPressed});

  final String title,subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///Title & SubTitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections),
              ///Buttons
              ///
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text(TTexts.tContinue))), // TODO Implement on pressed

            ],
          ),
        ),
      ),
    );
  }
}
