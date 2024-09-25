import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stardust_app_skeleton/common/widgets/artists/artists_row_list.dart';
import 'package:stardust_app_skeleton/common/widgets/back_button.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/artist_card.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/widgets/highlights/highlights_tab.dart';
import 'package:stardust_app_skeleton/features/shop/artist_page/widgets/products/products_tab.dart';
import 'package:stardust_app_skeleton/common/widgets/tabs_row.dart';
import 'package:stardust_app_skeleton/models/artist.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';
import 'package:stardust_app_skeleton/repository/artists_repository.dart';
import 'package:stardust_app_skeleton/repository/photocards_repository.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/logging/logger.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key, required this.id});

  final String id;

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  late Future<Artist> _artist;
  final ArtistsRepository _artistsRepository = ArtistsRepository.instance;
  bool tab1 = true;
  late Future<List<Photocard>> _photocardsFuture;
  final PhotocardsRepository _photocardRepository =
      PhotocardsRepository.instance;

  late Future<List<Map<String, dynamic>>> _highlightsFuture;

  String? _selectedArtistId;

  void _updateTab(bool isTab1) {
    setState(() {
      tab1 = isTab1;
    });
  }

  Future<Artist> _fetchArtist() async {
    return await _artistsRepository.getArtistById(widget.id);
  }

  Future<List<Photocard>> _fetchPhotocards() async {
    return await _photocardRepository.getPhotocardsByArtist(widget.id);
  }

  Future<List<Map<String, dynamic>>> _fetchHighlights() async {
    return await _artistsRepository.getArtistHighlights(widget.id);
  }

  @override
  void initState() {
    super.initState();
    _artist = _fetchArtist();
    _photocardsFuture = _fetchPhotocards();
    _highlightsFuture = _fetchHighlights();
  }

  void _filterProductsByArtist(String artistId) {
    setState(() {
      _selectedArtistId = artistId;
    });
  }

  void _resetFilter() {
    setState(() {
      _selectedArtistId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    StarLoggerHelper.debug('Building ArtistPage');
    StarLoggerHelper.debug('Artist ID: ${widget.id}');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: StarBackButton(),
              ),
              const SizedBox(height: 15),
              FutureBuilder<Artist>(
                future: _artist,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    StarLoggerHelper.debug('Error: ${snapshot.error}');
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('Artist not found'));
                  }

                  final artist = snapshot.data!;

                  return Column(
                    children: [
                      ArtistCard(imageUrl: artist.cover),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            artist.name,
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
                      if (artist.members.isNotEmpty)
                        ArtistsRowList(
                          artists: artist.members.whereType<Artist>().toList(),
                          goToArtistPage: false,
                          onArtistContainerPress: (selectedArtist) {
                            _resetFilter();
                            StarLoggerHelper.debug(
                                'Selected artist: ${selectedArtist.id}');
                            _filterProductsByArtist(selectedArtist.id);
                            _updateTab(false); // Switch to ProductsTab
                          },
                        ),
                      const SizedBox(height: 35),
                      TabsRow(
                        tab1: tab1,
                        onTabChanged: (isTab1) {
                          _updateTab(isTab1);
                          if (isTab1) {
                            _resetFilter();
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      FutureBuilder<List<Photocard>>(
                        future: _photocardsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData) {
                            return const Center(
                                child: Text('No products found'));
                          } else {
                            final photocards = snapshot.data!;
                            final filteredPhotocards = _selectedArtistId != null
                                ? photocards
                                    .where((pc) =>
                                        pc.memberId == _selectedArtistId)
                                    .toList()
                                : photocards;

                            if (tab1) {
                              return FutureBuilder<List<Map<String, dynamic>>>(
                                future: _highlightsFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child:
                                            Text('Error: ${snapshot.error}'));
                                  } else {
                                    final highlights = snapshot.data!;
                                    return HighlightsTab(
                                      storeId: widget.id,
                                      photocards: filteredPhotocards,
                                      highlights: highlights,
                                    );
                                  }
                                },
                              );
                            } else {
                              return ProductsTab(
                                  photocards: filteredPhotocards);
                            }
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
