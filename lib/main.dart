import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:stardust_app_skeleton/features/Search/screens/search.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/login/login.dart';
// import 'package:stardust_app_skeleton/features/home/screens/home.dart';
import 'package:stardust_app_skeleton/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: StarTheme.lightTheme,
      darkTheme: StarTheme.darkTheme,
      home: const LoginScreen(),
    );
  }
}
