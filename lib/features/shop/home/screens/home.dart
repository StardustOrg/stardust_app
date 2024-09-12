import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/artists_row_list.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/photocards_row_list.dart';
import 'package:stardust_app_skeleton/features/shop/home/widgets/slides_home.dart';
import 'package:stardust_app_skeleton/features/shop/home/widgets/topics_section.dart';
import 'package:stardust_app_skeleton/models/artist.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Photocard> photocards = [
      Photocard(
        artistName: "(G)-IDLE",
        pcName: "OT5 Photocard",
        price: 6.66,
        id: "1",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ullamcorper lorem in nibh posuere maximus. Aliquam erat volutpat. Etiam fringilla vulputate purus, ut mattis libero vestibulum a. Proin ligula ex, venenatis ut consequat non, consectetur porta velit. Vestibulum tincidunt quam et nulla euismod",
        imageUrl: "https://i.pinimg.com/originals/7b/7b/7b/",
      ),
      Photocard(
        artistName: "BTS",
        pcName: "Jungkook Photocard",
        price: 10.99,
        id: "2",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ullamcorper lorem in nibh posuere maximus. Aliquam erat volutpat. Etiam fringilla vulputate purus, ut mattis libero vestibulum a. Proin ligula ex, venenatis ut consequat non, consectetur porta velit. Vestibulum tincidunt quam et nulla euismod",
        imageUrl: "https://i.pinimg.com/originals/7b/7b/7b/",
      ),
      Photocard(
        artistName: "BLACKPINK",
        pcName: "Lisa Photocard",
        price: 8.99,
        id: "3",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ullamcorper lorem in nibh posuere maximus. Aliquam erat volutpat. Etiam fringilla vulputate purus, ut mattis libero vestibulum a. Proin ligula ex, venenatis ut consequat non, consectetur porta velit. Vestibulum tincidunt quam et nulla euismod",
        imageUrl: "https://i.pinimg.com/originals/7b/7b/7b/",
      ),
      Photocard(
        artistName: "TWICE",
        pcName: "Lisa Photocard",
        price: 8.99,
        id: "4",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ullamcorper lorem in nibh posuere maximus. Aliquam erat volutpat. Etiam fringilla vulputate purus, ut mattis libero vestibulum a. Proin ligula ex, venenatis ut consequat non, consectetur porta velit. Vestibulum tincidunt quam et nulla euismod",
        imageUrl: "https://i.pinimg.com/originals/7b/7b/7b/",
      ),
    ];

    List<Artist> artists = [
      Artist("ENHYPEN"),
      Artist("BTS"),
      Artist("BLACKPINK"),
      Artist("TWICE"),
      Artist("Red Velvet"),
      Artist("EXO"),
      Artist("NCT"),
      Artist("Mamamoo"),
      Artist("Stray Kids"),
      Artist("ITZY"),
    ];

    List<String> topics = [
      "Natal",
      "Season’s Greetings 2024",
      "Páscoa",
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            children: [
              // Header
              const Header(),
              const SizedBox(height: 45),
              const SlidesHome(),
              const SizedBox(height: 27),
              PhotocardsRowList(
                title: StarTexts.recommendationsPc,
                photocards: photocards,
                detailColor: StarColors.starBlue,
              ),
              const SizedBox(height: 25),
              ArtistsRowList(
                title: StarTexts.recommendationsArtist,
                artists: artists,
              ),
              const SizedBox(height: 25),
              PhotocardsRowList(
                title: StarTexts.newProducts,
                photocards: photocards,
                detailColor: StarColors.starBlue,
              ),
              const SizedBox(height: 25),
              TopicsSection(topics: topics),
              const SizedBox(height: 25),
              PhotocardsRowList(
                title: StarTexts.lastUnities,
                photocards: photocards,
                detailColor: StarColors.starBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
