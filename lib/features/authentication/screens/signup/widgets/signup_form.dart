import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/signup/singup.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';
import 'package:stardust_app_skeleton/features/authentication/controllers/signup_controller.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});

  // Initialize the SignupController using GetX
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StarTexts.signupTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),
          TextFormField(
            controller: signupController.emailController,
            decoration: const InputDecoration(
              labelText: StarTexts.email,
              hintText: StarTexts.emailLabel,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              return null;
            },
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),
          TextFormField(
            controller: signupController.usernameController,
            decoration: const InputDecoration(
              labelText: StarTexts.userName,
              hintText: StarTexts.userNameLabel,
            ),
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),
          TextFormField(
            controller: signupController.passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: StarTexts.password,
              hintText: StarTexts.passwordLabel,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),
          TextFormField(
            controller: signupController.confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: StarTexts.confirmPassword,
              hintText: StarTexts.confirmPasswordLabel,
            ),
            validator: (value) {
              if (value != signupController.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: StarSizes.spaceBtwSections),
          ElevatedButton(
            onPressed: () => signupController.signup(),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 0),
            ),
            child: const Text(StarTexts.signupTitle),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () => Get.to(() => const SignUpScreen()),
              child: const Text(StarTexts.haveAccount),
            ),
          ),
        ],
      ),
    );
  }
}
