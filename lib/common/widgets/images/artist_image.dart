import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class StarArtistImage extends StatelessWidget {
  const StarArtistImage({
    super.key,
    this.size = StarSizes.artistSm,
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
      height: size,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(StarSizes.borderRadiusXl),
        ),
        image: DecorationImage(
          image: NetworkImage(imageUrl!),
          fit: BoxFit.cover,
        ),
        border: Border(
          top: BorderSide(width: 2, color: borderColor), // Top side width
          left: BorderSide(width: 2, color: borderColor), // Left side width
          bottom: BorderSide(
            width: 1,
            color: borderColor,
          ), // Bottom side width
        ),
        color: StarColors.white,
      ),
      // TODO: Add image
    );
  }
}
