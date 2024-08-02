import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/signup/singup.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StarTexts.signupTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),
          TextFormField(
            decoration: const InputDecoration(
              labelText: StarTexts.email,
              hintText: StarTexts.emailLabel,
            ),
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: StarTexts.userName,
              hintText: StarTexts.userNameLabel,
            ),
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: StarTexts.password,
              hintText: StarTexts.passwordLabel,
            ),
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: StarTexts.confirmPassword,
              hintText: StarTexts.confirmPasswordLabel,
            ),
          ),
          const SizedBox(height: StarSizes.spaceBtwSections),
          ElevatedButton(
            onPressed: () {},
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
