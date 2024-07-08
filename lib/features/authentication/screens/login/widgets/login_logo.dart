import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: StarSizes.logoLg,
            height: StarSizes.logoLg,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: StarSizes.md),
          Text(
            StarTexts.appName,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 22.0,
                ),
          ),
        ],
      ),
    );
  }
}
