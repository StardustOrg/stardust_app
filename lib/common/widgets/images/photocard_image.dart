import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class StarPhotocardImage extends StatelessWidget {
  const StarPhotocardImage({
    super.key,
    this.size = StarSizes.photocardSm,
    this.imageUrl,
    required this.borderColor,
  });

  final double size;
  final String? imageUrl;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 1.4,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(StarSizes.borderRadiusLg),
        ),
        border: Border(
          top: BorderSide(width: 1, color: borderColor), // Top side width
          left: BorderSide(width: 2, color: borderColor), // Left side width
          bottom: BorderSide(
            width: 1,
            color: borderColor,
          ), // Bottom side width
        ),
        color: StarColors.bgLight,
      ),
      // TODO: Add image
    );
  }
}
