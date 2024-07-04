import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class StarPhotocardImage extends StatelessWidget {
  const StarPhotocardImage({
    super.key,
    this.size = StarSizes.photocardSm,
    this.imageUrl,
  });

  final double size;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 1.52,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(StarSizes.borderRadiusLg),
        ),
        color: StarColors.placeholder,
      ),
      // TODO: Add image
    );
  }
}
