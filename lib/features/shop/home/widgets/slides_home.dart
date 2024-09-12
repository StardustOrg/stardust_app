import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/custom_indicator.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class SlidesHome extends StatefulWidget {
  const SlidesHome({
    super.key,
  });

  @override
  State<SlidesHome> createState() => _SlidesHomeState();
}

class _SlidesHomeState extends State<SlidesHome> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Positioned images for decorative details
        Positioned(
          top: -20,
          left: -20,
          child: Image.asset(
            StarImages.slidesDetails3,
            width: 160,
          ),
        ),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            color: Colors.white,
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: StarDeviceUtils.getScreenWidth(context),
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.2 * i)),
                    child: Center(
                      child: Text(
                        'text $i',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Positioned(
          bottom: 10, // Adjust this value as needed
          left: 0,
          right: 0,
          child: StarDotsIndicator(
            pageLength: 5, // Number of pages in the carousel
            currentIndexPage: currentIndex,
          ),
        ),
        // Additional decorative images
        Positioned(
          top: -10,
          left: 10,
          child: Image.asset(
            StarImages.slidesDetails1,
            width: 39,
          ),
        ),
        Positioned(
          right: -38,
          bottom: -10,
          child: Image.asset(
            StarImages.slidesDetails2,
            width: 100,
          ),
        ),
      ],
    );
  }
}
