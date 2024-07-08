import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/login/widgets/login_form.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/login/widgets/login_logo.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/login/widgets/social_login.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: StarSizes.lg,
            vertical: StarSizes.xxl,
          ),
          child: Column(
            children: [
              // Logo
              LoginLogo(),

              // Form Fields
              SizedBox(height: StarSizes.spaceBtwSections),
              LoginForm(),

              // Other Ways
              SizedBox(height: StarSizes.spaceBtwSections),
              DifferentWaysToLogin()
            ],
          ),
        ),
      ),
    );
  }
}
