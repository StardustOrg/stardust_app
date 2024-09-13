import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/artists/artists_row_list.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocards_row_list.dart';
import 'package:stardust_app_skeleton/common/widgets/store/store_row_list.dart';
import 'package:stardust_app_skeleton/features/shop/home/widgets/slides_home.dart';
import 'package:stardust_app_skeleton/common/widgets/topics_section.dart';
import 'package:stardust_app_skeleton/models/artist.dart';
import 'package:stardust_app_skeleton/models/store.dart';
import 'package:stardust_app_skeleton/repository/artists_repository.dart';
import 'package:stardust_app_skeleton/repository/store_repository.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Artist>> _artistsFuture;
  final ArtistsRepository _artistsRepository = ArtistsRepository.instance;
  late Future<List<Store>> _storesFuture;
  final StoreRepository _storeRepository =
      StoreRepository.instance; // Instance for StoreRepository

  @override
  void initState() {
    super.initState();
    _artistsFuture = _fetchArtists();
    _storesFuture = _fetchStores(); // Fetch stores
  }

  Future<List<Artist>> _fetchArtists() async {
    return await _artistsRepository.getArtists();
  }

  Future<List<Store>> _fetchStores() async {
    return await _storeRepository.getStores();
  }

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
              FutureBuilder<List<Artist>>(
                future: _artistsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Loading indicator
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No artists found');
                  } else {
                    return ArtistsRowList(
                      title: StarTexts.recommendationsArtist,
                      artists: snapshot.data!,
                    );
                  }
                },
              ),
              const SizedBox(height: 25),
              FutureBuilder<List<Store>>(
                future: _storesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No stores found');
                  } else {
                    return StoreRowList(
                      title: "Lojas em alta", // Use the appropriate title
                      stores: snapshot.data!,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
