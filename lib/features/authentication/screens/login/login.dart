import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/login/widgets/login_form.dart';
import 'package:stardust_app_skeleton/common/widgets/app_logo.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/login/widgets/social_login.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';
// import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeadDetailsLogin(),
              // Logo
              Padding(
                padding: EdgeInsets.only(
                  left: StarSizes.lg,
                  right: StarSizes.lg,
                  bottom: StarSizes.xxl,
                ),
                child: Column(
                  children: [
                    StarLogo(),

                    // Form Fields
                    SizedBox(height: StarSizes.spaceBtwSections),
                    LoginForm(),

                    // Other Ways
                    SizedBox(height: StarSizes.spaceBtwSections),
                    DifferentWaysToLogin()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeadDetailsLogin extends StatelessWidget {
  const HeadDetailsLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.white],
              stops: [0.2, 1.0],
            ).createShader(rect);
          },
          blendMode: BlendMode.srcATop,
          child: Image.asset(
            StarImages.mesh,
          ),
        ),
        Positioned(
          top: 26,
          right: -39,
          child: Image.asset(
            StarImages.moons,
            width: StarDeviceUtils.getScreenWidth(context) * 0.28,
          ),
        ),
      ],
    );
  }
}
