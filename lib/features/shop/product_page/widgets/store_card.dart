import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/common/widgets/RatingTag.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/screens/store_page.dart';
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
        onTap: () => Get.to(() => StorePage(storeId: storeId)),
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
                      RatingTag(rating: rating),
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
