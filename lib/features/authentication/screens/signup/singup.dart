import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/app_logo.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: StarSizes.lg,
            vertical: StarSizes.xxl,
          ),
          child: Column(
            children: [
              // Logo
              StarLogo(),

              // Form Fields
              SizedBox(height: StarSizes.spaceBtwSections),
              // SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
