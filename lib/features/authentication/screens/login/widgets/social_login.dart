import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';

class DifferentWaysToLogin extends StatelessWidget {
  const DifferentWaysToLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                StarImages.google,
                width: StarSizes.iconMd,
                height: StarSizes.iconMd,
              ),
              const SizedBox(width: StarSizes.defaultSpace),
              const Text(StarTexts.loginWithGoogle),
            ],
          ),
        ),
        const SizedBox(height: StarSizes.spaceBtwItems),
        OutlinedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                StarImages.facebook,
                width: StarSizes.iconMd,
                height: StarSizes.iconMd,
              ),
              const SizedBox(width: StarSizes.defaultSpace),
              const Text(StarTexts.loginWithFacebook),
            ],
          ),
        ),
      ],
    );
  }
}
