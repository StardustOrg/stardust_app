import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/common/widgets/RatingTag.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/screens/store_page.dart';
import 'package:stardust_app_skeleton/repository/store_repository.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';

class StoreCard extends StatefulWidget {
  const StoreCard({
    super.key,
    required this.rating,
    required this.storeName,
    required this.storeId,
  });

  final double rating;
  final String storeName, storeId;

  @override
  State<StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> {
  late Future<String?> _storeIcon;
  final StoreRepository _storeRepository = StoreRepository.instance;

  Future<String?> _fetchStoreIcon() async {
    return await _storeRepository.getStoreById(widget.storeId).then((store) {
      return store.icon;
    });
  }

  @override
  void initState() {
    super.initState();
    _storeIcon = _fetchStoreIcon();
  }

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
        onTap: () => Get.to(() => StorePage(storeId: widget.storeId)),
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
                      FutureBuilder<String?>(
                        future: _storeIcon,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              width: 35,
                              height: 35,
                              decoration: const ShapeDecoration(
                                color: StarColors.placeholder,
                                shape: OvalBorder(),
                              ),
                            );
                          } else if (snapshot.hasError ||
                              !snapshot.hasData ||
                              snapshot.data == null) {
                            return Container(
                              width: 35,
                              height: 35,
                              decoration: const ShapeDecoration(
                                color: StarColors.placeholder,
                                shape: OvalBorder(),
                              ),
                            );
                          } else {
                            return Container(
                              width: 35,
                              height: 35,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(snapshot.data!),
                                  fit: BoxFit.cover,
                                ),
                                shape: OvalBorder(),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.storeName,
                        style: const TextStyle(
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
                      RatingTag(rating: widget.rating),
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
