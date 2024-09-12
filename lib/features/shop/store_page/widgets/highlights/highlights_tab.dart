import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocards_row_list.dart';
import 'package:stardust_app_skeleton/common/widgets/topics_section.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/widgets/highlights/slides_highlights.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';

class StoreHighlightsTab extends StatefulWidget {
  const StoreHighlightsTab({super.key});

  @override
  State<StoreHighlightsTab> createState() => _StoreHighlightsTabState();
}

class _StoreHighlightsTabState extends State<StoreHighlightsTab> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SlidesHightlights(),
        const SizedBox(height: 30),
        PhotocardsRowList(
          title: "VOCÊ TAMBÉM PODE SE INTERESSAR",
          photocards: photocards,
        ),
        const SizedBox(height: 30),
        const TopicsSection(
          title: "TAGS DA LOJA",
          topics: ["tag", "tag", "tag", "tag", "tag", "tag", "tag"],
        ),
        const SizedBox(height: 30),
        PhotocardsRowList(
          title: "Últimas unidades",
          photocards: photocards,
        ),
      ],
    );
  }
}
