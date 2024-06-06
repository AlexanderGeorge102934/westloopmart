import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class TCreateAccountHeader extends StatelessWidget {
  const TCreateAccountHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(TTexts.signUpTitle, style: Theme.of(context).textTheme.headlineMedium,),
        SizedBox(height: TSizes.md(context)),
      ],
    );
  }
}