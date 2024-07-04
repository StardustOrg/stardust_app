import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/images/store_image.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class StoreContainer extends StatelessWidget {
  const StoreContainer({super.key, this.imageUrl, required this.storeName});

  final String? imageUrl;
  final String storeName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StarStoreImage(imageUrl: imageUrl),
        const SizedBox(height: StarSizes.xs),
        Text(storeName),
      ],
    );
  }
}
