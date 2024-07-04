import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/images/photocard_image.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class PhotocardContainer extends StatelessWidget {
  const PhotocardContainer({
    super.key,
    this.imageUrl,
    this.size = StarSizes.photocardSm,
    required this.artistName,
    required this.pcName,
    required this.price,
  });

  final double size, price;
  final String? imageUrl;
  final String artistName, pcName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StarPhotocardImage(imageUrl: imageUrl, size: size),
        const SizedBox(height: StarSizes.xs),
        Text(
          artistName,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: StarSizes.xxs),
        Text(
          pcName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: StarSizes.xxs),
        Text(
          UtilBrasilFields.obterReal(price),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
