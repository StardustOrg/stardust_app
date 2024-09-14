import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/artists/artists_row_list.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocards_row_list.dart';
import 'package:stardust_app_skeleton/common/widgets/store/store_row_list.dart';
import 'package:stardust_app_skeleton/features/shop/home/widgets/slides_home.dart';
import 'package:stardust_app_skeleton/models/artist.dart';
import 'package:stardust_app_skeleton/models/store.dart';
import 'package:stardust_app_skeleton/repository/artists_repository.dart';
import 'package:stardust_app_skeleton/repository/photocards_repository.dart';
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
  final StoreRepository _storeRepository = StoreRepository.instance;

  late Future<List<Photocard>> _photocardsFuture;
  final PhotocardsRepository _photocardRepository =
      PhotocardsRepository.instance;

  @override
  void initState() {
    super.initState();
    _artistsFuture = _fetchArtists();
    _storesFuture = _fetchStores();
    _photocardsFuture = _fetchPhotocards();
  }

  Future<List<Artist>> _fetchArtists() async {
    return await _artistsRepository.getArtists();
  }

  Future<List<Store>> _fetchStores() async {
    return await _storeRepository.getStores();
  }

  Future<List<Photocard>> _fetchPhotocards() async {
    return await _photocardRepository.getAllPhotocards(limit: 10);
  }

  @override
  Widget build(BuildContext context) {
    // List<String> topics = [
    //   "Natal",
    //   "Season’s Greetings 2024",
    //   "Páscoa",
    // ];

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
              FutureBuilder<List<Photocard>>(
                future: _photocardsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No photocards found');
                  } else {
                    return PhotocardsRowList(
                      title: StarTexts.recommendationsPc,
                      photocards: snapshot.data!,
                      detailColor: StarColors.starBlue,
                    );
                  }
                },
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
