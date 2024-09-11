import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class StarLogo extends StatelessWidget {
  const StarLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            StarImages.logo,
            semanticsLabel: 'brand logo',
            width: StarDeviceUtils.getScreenWidth(context) * 0.5,
          ),
        ],
      ),
    );
  }
}
