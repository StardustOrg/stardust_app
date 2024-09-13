import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/signup/singup.dart';
import 'package:stardust_app_skeleton/features/shop/wrapper.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StarTexts.loginTitle,
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
              labelText: StarTexts.password,
              hintText: StarTexts.passwordLabel,
            ),
          ),
          const SizedBox(height: StarSizes.xxs),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(StarTexts.forgotPassword),
            ),
          ),
          const SizedBox(height: StarSizes.spaceBtwSections),
          ElevatedButton(
            onPressed: () => Get.to(() => const ScreenWrapper()),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 0),
            ),
            child: const Text(StarTexts.login),
          ),
          const SizedBox(height: StarSizes.xxs),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () => Get.to(() => const SignUpScreen()),
              child: const Text(StarTexts.signUp),
            ),
          ),
        ],
      ),
    );
  }
}
