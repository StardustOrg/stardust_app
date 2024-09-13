import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocards_row_list.dart';
import 'package:stardust_app_skeleton/common/widgets/topics_section.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/widgets/highlights/slides_highlights.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';

class HighlightsTab extends StatefulWidget {
  const HighlightsTab({super.key});

  @override
  State<HighlightsTab> createState() => _HighlightsTabState();
}

class _HighlightsTabState extends State<HighlightsTab> {
  List<Photocard> photocards = [];

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
          title: StarTexts.recommendationsTopics,
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
