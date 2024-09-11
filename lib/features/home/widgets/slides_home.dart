import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class SlidesHome extends StatefulWidget {
  const SlidesHome({
    super.key,
  });

  @override
  State<SlidesHome> createState() => _SlidesHomeState();
}

class _SlidesHomeState extends State<SlidesHome> {
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
            "assets/details/slides_details3.png",
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
              onPageChanged: (index, reason) {},
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

        // Additional decorative images
        Positioned(
          top: -10,
          left: 10,
          child: Image.asset(
            "assets/details/slides_detail1.png",
            width: 39,
          ),
        ),
        Positioned(
          right: -38,
          bottom: -10,
          child: Image.asset(
            "assets/details/slides_details2.png",
            width: 100,
          ),
        ),
      ],
    );
  }
}
