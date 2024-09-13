import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/custom_indicator.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class StoreSlidesHightlights extends StatefulWidget {
  const StoreSlidesHightlights({
    super.key,
  });

  @override
  State<StoreSlidesHightlights> createState() => _StoreSlidesHightlightsState();
}

class _StoreSlidesHightlightsState extends State<StoreSlidesHightlights> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
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
                        BoxDecoration(color: Colors.blue.withOpacity(0.2 * i)),
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
      ],
    );
  }
}
