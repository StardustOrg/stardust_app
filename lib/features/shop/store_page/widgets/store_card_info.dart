import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/common/widgets/RatingTag.dart';
import 'package:stardust_app_skeleton/common/widgets/images/store_image.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class StoreCardInfo extends StatelessWidget {
  const StoreCardInfo({
    super.key,
    required this.storeName,
    required this.rating,
    required this.place,
    required this.insta,
    required this.icon,
  });

  final String storeName;
  final String icon;
  final double rating;
  final String place;
  final String insta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StarStoreImage(
            size: StarDeviceUtils.getScreenWidth(context) * 0.25,
            imageUrl: icon,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: StarDeviceUtils.getScreenWidth(context) * 0.55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      storeName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    RatingTag(
                      rating: rating,
                      showBorder: false,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  SvgPicture.asset(StarImages.map),
                  const SizedBox(width: 10),
                  Text(
                    place,
                    style: const TextStyle(
                      color: StarColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.asset(StarImages.insta),
                  const SizedBox(width: 10),
                  Text(
                    insta,
                    style: const TextStyle(
                      color: StarColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: StarDeviceUtils.getScreenWidth(context) * 0.55,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat_rounded,
                    size: 20,
                  ),
                  label: const Text("Conversar"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
