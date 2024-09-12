import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
    required this.rating,
    required this.storeName,
    required this.storeId,
  });

  final double rating;
  final String storeName, storeId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(StarImages.mesh),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: ShapeDecoration(
                color: StarColors.bgLight,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 0.5,
                    color: StarColors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const ShapeDecoration(
                          color: StarColors.placeholder,
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Loja",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: StarColors.starBlue,
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
                      ),
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: StarColors.starBlue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -9,
              left: -9,
              child: Image.asset(
                StarImages.slidesDetails1,
                width: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
