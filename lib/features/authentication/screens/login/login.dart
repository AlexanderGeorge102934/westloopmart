import 'package:flutter/material.dart';
import 'package:startup_app/common/styles/spacing_styles.dart';

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







