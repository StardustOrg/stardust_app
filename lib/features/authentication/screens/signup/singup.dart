import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/app_logo.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StarColors.bgLight,
        iconTheme: const IconThemeData(color: StarColors.starPink),
      ),
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
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SignupForm(),
      ],
    );
  }
}
