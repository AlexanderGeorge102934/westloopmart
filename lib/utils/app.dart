
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:startup_app/utils/constants/colors.dart';

import '../bindings/general_bindings.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme(context),
      darkTheme: TAppTheme.darkTheme(context),
      initialBinding: GeneralBindings(),
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
      // home: const LoginScreen(),
    );
  }
}