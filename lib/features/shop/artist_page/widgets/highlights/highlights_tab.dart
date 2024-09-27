import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocards_row_list.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/widgets/highlights/slides_highlights.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';

class HighlightsTab extends StatefulWidget {
  const HighlightsTab({
    super.key,
    required this.storeId,
    required this.photocards,
    required this.highlights,
  });
  final List<Map<String, dynamic>> highlights;
  final List<Photocard> photocards;
  final String storeId;
  @override
  State<HighlightsTab> createState() => _HighlightsTabState();
}

class _HighlightsTabState extends State<HighlightsTab> {
  @override
  Widget build(BuildContext context) {
    List<Photocard> lastUnits =
        widget.photocards.where((photocard) => photocard.quantity < 5).toList();
    return Column(
      children: [
        SlidesHightlights(
          highlights: widget.highlights,
        ),
        const SizedBox(height: 30),
        PhotocardsRowList(
          title: "VOCÊ TAMBÉM PODE SE INTERESSAR",
          photocards: widget.photocards,
        ),
        // const SizedBox(height: 30),
        // const TopicsSection(
        //   title: StarTexts.recommendationsTopics,
        //   topics: [],
        //   goToScreen: true,
        // ),
        const SizedBox(height: 30),
        PhotocardsRowList(
          title: "Últimas unidades",
          photocards: lastUnits,
        ),
      ],
    );
  }
}
