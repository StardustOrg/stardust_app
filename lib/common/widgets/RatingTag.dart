import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';

class RatingTag extends StatelessWidget {
  const RatingTag({
    super.key,
    required this.rating,
    this.showBorder = true,
  });

  final double rating;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: showBorder
          ? const EdgeInsets.symmetric(horizontal: 5, vertical: 2)
          : null,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: showBorder ? StarColors.starBlue : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            StarImages.star,
            colorFilter: const ColorFilter.mode(
              StarColors.starBlue,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            "$rating/5.0",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: StarColors.starBlue,
            ),
          ),
        ],
      ),
    );
  }
}
