import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';

class PcTypeTag extends StatelessWidget {
  const PcTypeTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: StarColors.starPink,
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            StarImages.fourPointStar,
            semanticsLabel: 'four point star',
            colorFilter: const ColorFilter.mode(
              StarColors.bgLight,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            StarTexts.originalTag,
            style: TextStyle(
              color: StarColors.bgLight,
              fontWeight: FontWeight.w400,
              height: 0,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 5),
          SvgPicture.asset(
            StarImages.fourPointStar,
            semanticsLabel: 'four point star',
            colorFilter: const ColorFilter.mode(
              StarColors.bgLight,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
