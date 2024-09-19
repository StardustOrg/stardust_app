import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/custom_indicator.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class SlidesHightlights extends StatefulWidget {
  const SlidesHightlights({
    super.key,
    required this.highlights,
  });

  final List<Map<String, dynamic>> highlights;

  @override
  State<SlidesHightlights> createState() => _SlidesHightlightsState();
}

class _SlidesHightlightsState extends State<SlidesHightlights> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.highlights.isNotEmpty) {
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
              items: widget.highlights.map((highlight) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: StarDeviceUtils.getScreenWidth(context),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(
                            0.2 * (widget.highlights.indexOf(highlight) + 1)),
                        image: DecorationImage(
                          image: NetworkImage(highlight['photo']),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.15),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: StarDotsIndicator(
                pageLength:
                    widget.highlights.length, // Number of pages in the carousel
                currentIndexPage: currentIndex,
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
