import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/custom_indicator.dart';
import 'package:stardust_app_skeleton/repository/highlights_repository.dart';
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
  late Future<List<Map<String, dynamic>>> _highlightsFuture;
  final HightlightsRepository _highlightsRepository =
      HightlightsRepository.instance;

  @override
  void initState() {
    super.initState();
    _highlightsFuture = _fetchHighlights();
  }

  Future<List<Map<String, dynamic>>> _fetchHighlights() async {
    return await _highlightsRepository.getAllHighlights();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _highlightsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.isEmpty) {
          return Container();
        } else {
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
                  items: snapshot.data!.asMap().entries.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: StarDeviceUtils.getScreenWidth(context),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2 * i.key),
                            image: DecorationImage(
                              image: NetworkImage(i.value['photo']),
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
                child: StarDotsIndicator(
                  pageLength: snapshot.data!.length,
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
      },
    );
  }
}
