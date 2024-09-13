import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/common/widgets/images/artist_image.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/screens/artist_page.dart';
import 'package:stardust_app_skeleton/models/artist.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class ArtistContainer extends StatelessWidget {
  const ArtistContainer({
    super.key,
    required this.artist,
    required this.borderColor,
  });

  final Artist artist;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ArtistPage(id: artist.id)),
      child: Column(
        children: [
          StarArtistImage(imageUrl: artist.icon, borderColor: borderColor),
          const SizedBox(height: StarSizes.xs),
          SizedBox(
            width: StarSizes.artistSm + 5,
            child: Text(
              artist.name,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
