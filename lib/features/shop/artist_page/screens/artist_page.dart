import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_app_skeleton/common/widgets/artists/artists_row_list.dart';
import 'package:stardust_app_skeleton/common/widgets/back_button.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/artist_card.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/widgets/highlights/highlights_tab.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/widgets/products/products_tab.dart';
import 'package:stardust_app_skeleton/common/widgets/tabs_row.dart';
import 'package:stardust_app_skeleton/models/artist.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key, required this.id});

  final String id;

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  String imageUrl = "";
  bool tab1 = true;

  void _updateTab(bool isTab1) {
    setState(() {
      tab1 = isTab1;
    });
  }

  List<Artist> artists = [
    Artist("Jungwon"),
    Artist("Heeseung"),
    Artist("Jay"),
    Artist("Jake"),
    Artist("Sunghoon"),
    Artist("Sunoo"),
    Artist("Ni-ki"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: StarBackButton(),
              ),
              const SizedBox(height: 15),
              ArtistCard(imageUrl: imageUrl),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.id,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    StarImages.sparkles,
                    colorFilter: const ColorFilter.mode(
                      StarColors.starPink,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              if (artists.isNotEmpty) ArtistsRowList(artists: artists),
              const SizedBox(height: 35),
              TabsRow(
                tab1: tab1,
                onTabChanged: _updateTab,
              ),
              const SizedBox(height: 30),
              if (tab1) const HighlightsTab(),
              if (!tab1) const ProductsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
