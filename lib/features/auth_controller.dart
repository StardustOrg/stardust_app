import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/login/login.dart';
import 'package:stardust_app_skeleton/features/shop/wrapper.dart';
import 'package:stardust_app_skeleton/models/user.dart';

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserApp?>(context);
    if (user == null) {
      return const LoginScreen();
    } else {
      return ScreenWrapper(user: user);
    }
  }
}
