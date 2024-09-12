import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
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
              SvgPicture.asset(
                StarImages.googleSvg,
                height: StarSizes.iconMd,
                colorFilter:
                    const ColorFilter.mode(StarColors.grey, BlendMode.srcIn),
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
              SvgPicture.asset(
                StarImages.facebookSvg,
                height: StarSizes.iconMd,
                colorFilter:
                    const ColorFilter.mode(StarColors.grey, BlendMode.srcIn),
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
