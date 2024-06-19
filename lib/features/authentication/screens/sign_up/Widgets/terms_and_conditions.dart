import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../controllers/sign_up/create_account_controller.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({
    super.key, required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = CreateAccountController.instance;
    return Row(

      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.06,
            height: MediaQuery.of(context).size.height * 0.03,
            child: Obx(
                    ()=> Checkbox(
                      value: controller.checkBox.value,
                      onChanged: (value) => controller.checkBox.value = !controller.checkBox.value,))),
        SizedBox(width: TSizes.spaceBtwItems(context)),

        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                  children: [
                    ///I agree to
                    TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                    ///Privacy Policy
                    TextSpan(text: TTexts.privacyPolicy, style: Theme.of(context).textTheme.bodyMedium!.apply(
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
          ),
        ),
      ],
    );
  }
}