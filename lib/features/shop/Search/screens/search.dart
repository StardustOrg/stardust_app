import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/artists/artist_wrap_list.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocards_row_list.dart';
import 'package:stardust_app_skeleton/common/widgets/store/store_wrap_list.dart';
import 'package:stardust_app_skeleton/models/store.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';
import 'package:stardust_app_skeleton/models/artist.dart';

class Search extends StatelessWidget {
  const Search({super.key});

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

    List<Store> stores = [
      // Store("Lojinha 1"),
      // Store("Lojinha 2"),
      // Store("Lojinha 3"),
      // Store("Lojinha 4"),
      // Store("Lojinha 5"),
      // Store("Lojinha 6"),
      // Store("Lojinha 7"),
      // Store("Lojinha 8"),
    ];

    List<Artist> artists = [
      // Artist("ENHYPEN"),
      // Artist("BTS"),
      // Artist("BLACKPINK"),
      // Artist("TWICE"),
      // Artist("Red Velvet"),
      // Artist("EXO"),
      // Artist("NCT"),
      // Artist("Mamamoo"),
      // Artist("Stray Kids"),
      // Artist("ITZY"),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              const Header(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.filter_list_alt),
                        onPressed: () {
                          // Ação ao clicar no ícone de filtro
                        },
                      ),
                      const Text(
                        StarTexts.filterLabel,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              PhotocardsRowList(
                title: StarTexts.photocard,
                photocards: photocards,
              ),
              const SizedBox(height: 27),
              StoreWrapList(title: "LOJAS RECOMENDADAS", stores: stores),
              const SizedBox(height: 27),
              ArtistWrapList(title: "ARTISTAS RECOMENDADAS", artists: artists),
              const SizedBox(height: 27),
            ],
          ),
        ),
      ),
    );
  }
}
