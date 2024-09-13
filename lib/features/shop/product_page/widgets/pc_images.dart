import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class PhotocardImagesCont extends StatelessWidget {
  const PhotocardImagesCont({
    super.key,
    required this.mainImage,
    required this.dt1,
    required this.dt2,
  });

  final String mainImage, dt1, dt2;

  @override
  Widget build(BuildContext context) {
    double mainPcSize = StarDeviceUtils.getScreenWidth(context) * 0.5;
    double smallPcSize = StarDeviceUtils.getScreenWidth(context) * 0.34;
    double gap = StarDeviceUtils.getScreenWidth(context) * 0.02;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: mainPcSize,
                height: mainPcSize * 1.4,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: StarColors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned(
                left: -41,
                top: 48,
                child: Image.asset(
                  StarImages.slidesDetails2,
                  width: 100,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: smallPcSize,
                height: smallPcSize,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: StarColors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                // TODO: add image
              ),
              SizedBox(height: gap),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: smallPcSize,
                    height: smallPcSize,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(width: 1, color: StarColors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    // TODO: add image
                  ),
                  Positioned(
                    right: -5,
                    top: -6,
                    child: SvgPicture.asset(
                      StarImages.fallingSparkles,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
