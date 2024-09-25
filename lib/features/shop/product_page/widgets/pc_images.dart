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
    required this.onTap,
    required this.isFavorite,
  });

  final String mainImage;
  final String? dt1, dt2;
  final VoidCallback? onTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    double mainPcSize = StarDeviceUtils.getScreenWidth(context) * 0.5;
    double smallPcSize = StarDeviceUtils.getScreenWidth(context) * 0.34;
    double gap = StarDeviceUtils.getScreenWidth(context) * 0.02;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: (dt1 != null || dt2 != null)
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
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
                  image: DecorationImage(
                    image: NetworkImage(mainImage),
                    fit: BoxFit.cover,
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
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 5.0,
                    left: 10.0,
                    right: 50.0,
                    top: 50.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomLeft: Radius.circular(20),
                    ),
                    gradient: RadialGradient(
                      center: AlignmentDirectional.bottomStart,
                      colors: [
                        StarColors.bgDark.withOpacity(1),
                        StarColors.bgDark.withOpacity(0.1),
                        StarColors.bgDark.withOpacity(0.05),
                        Colors.transparent,
                      ],
                      radius: 3,
                    ),
                  ),
                  child: IconButton(
                    onPressed: onTap,
                    splashColor: StarColors.starPink,
                    highlightColor: StarColors.starPink.withOpacity(0.4),
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      size: 30,
                      color: StarColors.starPink,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (dt1 != null || dt2 != null)
            Column(
              children: [
                if (dt1 != null)
                  Container(
                    width: smallPcSize,
                    height: smallPcSize,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(width: 1, color: StarColors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(dt1!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                SizedBox(height: gap),
                if (dt2 != null)
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: smallPcSize,
                        height: smallPcSize,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: StarColors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(dt2!),
                            fit: BoxFit.cover,
                          ),
                        ),
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
