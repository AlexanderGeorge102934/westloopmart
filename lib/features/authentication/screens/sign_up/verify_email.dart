
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/common/widgets/success_screen/success_screen.dart';
import 'package:startup_app/features/authentication/screens/login/login.dart';
import 'package:startup_app/utils/constants/image_strings.dart';
import 'package:startup_app/utils/constants/sizes.dart';
import 'package:startup_app/utils/constants/texts.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()=>Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              ///Image

              ///TItle & SubTitle
              Text(TTexts.verifyEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text('support@whatever.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections),
              ///Buttons
              ///
              SizedBox(width: double.infinity, child:
                ElevatedButton(onPressed: ()=> Get.to(()=> SuccessScreen(
                  title: TTexts.yourAccountCreatedTitle,
                  subTitle: TTexts.yourAccountCreatedSubTitle,
                  onPressed: () => Get.to(()=> const LoginScreen()))),
                    child: const Text(TTexts.tContinue))), // TODO Implement on pressed
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(TTexts.resendEmail))), // TODO Implement on pressed


            ],
          ),
        ),
      ),
    );
  }
}
