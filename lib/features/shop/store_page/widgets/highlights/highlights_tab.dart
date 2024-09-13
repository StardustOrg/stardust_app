import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocards_row_list.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/widgets/highlights/slides_highlights.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';

class StoreHighlightsTab extends StatefulWidget {
  const StoreHighlightsTab({super.key, required this.photocards});
  final List<Photocard> photocards;
  @override
  State<StoreHighlightsTab> createState() => _StoreHighlightsTabState();
}

class _StoreHighlightsTabState extends State<StoreHighlightsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SlidesHightlights(),
        const SizedBox(height: 30),
        PhotocardsRowList(
          title: "PRODUTOS DA LOJA",
          photocards: widget.photocards,
        ),
        const SizedBox(height: 30),
        // const TopicsSection(
        //   title: "TAGS DA LOJA",
        //   topics: ["tag", "tag", "tag", "tag", "tag", "tag", "tag"],
        // ),
        // const SizedBox(height: 30),
        // PhotocardsRowList(
        //   title: "Últimas unidades",
        //   photocards: widget.photocards,
        // ),
      ],
    );
  }
}
