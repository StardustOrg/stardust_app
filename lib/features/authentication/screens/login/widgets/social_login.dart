// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/features/shop/wrapper.dart';
import 'package:stardust_app_skeleton/services/auth.dart';
import 'package:stardust_app_skeleton/features/shop/home/screens/home.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';

class DifferentWaysToLogin extends StatelessWidget {
  const DifferentWaysToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final Auth auth = Auth();

    return Column(
      children: [
        OutlinedButton(
          onPressed: () async {
            try {
              await auth.signInWithGoogle();
              Get.to(() => const Home());
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to login: $e')),
              );
            }
          },
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
          onPressed: () async {
            final result = await auth.signInWithGoogle();
            if (result['authenticated']) {
              // Navega para a tela principal se a autenticação foi bem-sucedida
              Get.to(() => const ScreenWrapper());
            } else {
              // Exibe uma mensagem de erro se a autenticação falhar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to login: ${result['error']}'),
                ),
              );
            }
          },
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
