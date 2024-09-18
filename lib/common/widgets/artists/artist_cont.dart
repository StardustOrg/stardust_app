import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/images/artist_image.dart';
import 'package:stardust_app_skeleton/models/artist.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class ArtistContainer extends StatelessWidget {
  const ArtistContainer({
    super.key,
    required this.artist,
    required this.borderColor,
    required this.onPressed,
  });

  final Artist artist;
  final Color borderColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          StarArtistImage(imageUrl: artist.icon, borderColor: borderColor),
          const SizedBox(height: StarSizes.xs),
          Text(
            artist.name,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
