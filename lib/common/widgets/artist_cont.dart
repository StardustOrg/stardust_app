import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/images/artist_image.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class ArtistContainer extends StatelessWidget {
  const ArtistContainer({
    super.key,
    this.imageUrl,
    required this.artistName,
  });

  final String? imageUrl;
  final String artistName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArtistImage(imageUrl: imageUrl),
        const SizedBox(height: StarSizes.xs),
        Text(artistName),
      ],
    );
  }
}
