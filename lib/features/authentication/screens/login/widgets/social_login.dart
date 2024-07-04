import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class DifferentWaysToLogin extends StatelessWidget {
  const DifferentWaysToLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 0),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Entrar com o Google"),
            ],
          ),
        ),
        const SizedBox(height: StarSizes.spaceBtwItems),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 0),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Entrar com o Facebook"),
            ],
          ),
        ),
      ],
    );
  }
}