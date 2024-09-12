import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/common/widgets/images/artist_image.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/screens/artist_page.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class ArtistContainer extends StatelessWidget {
  const ArtistContainer({
    super.key,
    this.imageUrl,
    required this.artistName,
    required this.borderColor,
  });

  final String? imageUrl;
  final String artistName;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ArtistPage(id: "id")),
      child: Column(
        children: [
          StarArtistImage(imageUrl: imageUrl, borderColor: borderColor),
          const SizedBox(height: StarSizes.xs),
          SizedBox(
            width: StarSizes.artistSm + 5,
            child: Text(
              artistName,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
