import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/images/photocard_image.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class PhotocardContainer extends StatelessWidget {
  const PhotocardContainer({
    super.key,
    this.imageUrl,
    this.size = StarSizes.photocardSm,
    required this.artistName,
    required this.pcName,
    required this.price,
    this.borderColor = StarColors.textSecondary,
  });

  final double size, price;
  final String? imageUrl;
  final String artistName, pcName;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StarPhotocardImage(
          imageUrl: imageUrl,
          size: size,
          borderColor: borderColor,
        ),
        const SizedBox(height: StarSizes.xs),
        SizedBox(
          width: size,
          child: Text(
            artistName,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: StarSizes.xxs),
        SizedBox(
          width: size,
          child: Text(
            pcName,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: StarSizes.xxs),
        SizedBox(
          width: size,
          child: Text(
            UtilBrasilFields.obterReal(price),
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
