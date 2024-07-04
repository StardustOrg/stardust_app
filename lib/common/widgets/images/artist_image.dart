import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class ArtistImage extends StatelessWidget {
  const ArtistImage({
    super.key,
    this.size = StarSizes.storeSmall,
    this.imageUrl,
  });

  final double? size;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(StarSizes.xl)),
        color: StarColors.placeholder2,
      ),
    );
  }
}
