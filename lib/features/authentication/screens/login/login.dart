import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/common/styles/spacing_styles.dart';
import 'package:startup_app/common/widgets/form_divider.dart';
import 'package:startup_app/helpers/helpers.dart';
import 'package:startup_app/utils/constants/colors.dart';
import 'package:startup_app/utils/constants/image_strings.dart';
import 'package:startup_app/utils/constants/sizes.dart';
import 'package:startup_app/utils/constants/texts.dart';

import '../../../../common/widgets/social_buttons.dart';
import 'Widgets/login_form.dart';
import 'Widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight(context),
          child: const Column(
            children: [
              /// Logo, Title & Sub-Title
              TLoginHeader(),

              /// Form
              TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}







