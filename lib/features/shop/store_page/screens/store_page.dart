import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/artist_card.dart';
import 'package:stardust_app_skeleton/common/widgets/back_button.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/tabs_row.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/widgets/highlights/highlights_tab.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/widgets/products/products_tab.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/widgets/store_card_info.dart';
// import 'package:stardust_app_skeleton/models/cep.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';
import 'package:stardust_app_skeleton/models/store.dart';
import 'package:stardust_app_skeleton/repository/photocards_repository.dart';
import 'package:stardust_app_skeleton/repository/store_repository.dart';
// import 'package:stardust_app_skeleton/utils/http/search_cep.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key, required this.storeId});

  final String storeId;

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late Future<Store> _storeFuture;
  final StoreRepository _storeRepository = StoreRepository.instance;
  String? location;
  bool tab1 = true;
  late Future<List<Photocard>> _photocardsFuture;
  final PhotocardsRepository _photocardRepository =
      PhotocardsRepository.instance;

  late Future<List<Map<String, dynamic>>> _highlightsFuture;

  void _updateTab(bool isTab1) {
    setState(() {
      tab1 = isTab1;
    });
  }

  @override
  void initState() {
    super.initState();
    _storeFuture = _fetchStore();

    _photocardsFuture = _fetchPhotocards();
    _highlightsFuture = _fetchHighlights();
  }

  Future<Store> _fetchStore() async {
    return await _storeRepository.getStoreById(widget.storeId);
  }

  Future<List<Photocard>> _fetchPhotocards() async {
    return await _photocardRepository.getPhotocardByStore(widget.storeId);
  }

  Future<List<Map<String, dynamic>>> _fetchHighlights() async {
    return await _storeRepository.getStoreHighlights(widget.storeId);
  }

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
              FutureBuilder<Store>(
                future: _storeFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return const Text('No store data found');
                  } else {
                    Store store = snapshot.data!;
                    return Column(
                      children: [
                        ArtistCard(imageUrl: store.icon),
                        const SizedBox(height: 30),
                        FutureBuilder<String>(
                          future: store.getLocalidadeUf(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData) {
                              return const Text('No location data found');
                            } else {
                              return StoreCardInfo(
                                storeName: store.name,
                                rating: store.rating!,
                                place: snapshot.data!,
                                insta: store.insta,
                                icon: store.icon,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 35),
                        TabsRow(
                          tab1: tab1,
                          onTabChanged: _updateTab,
                        ),
                        const SizedBox(height: 30),
                        FutureBuilder<List<Photocard>>(
                          future: _photocardsFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData) {
                              return const Text('No products found');
                            } else {
                              if (tab1) {
                                return FutureBuilder<
                                    List<Map<String, dynamic>>>(
                                  future: _highlightsFuture,
                                  builder: (context, highSnapshot) {
                                    if (highSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    } else if (highSnapshot.hasError) {
                                      return Text(
                                          'Error: ${highSnapshot.error}');
                                    } else {
                                      return StoreHighlightsTab(
                                        photocards: snapshot.data!,
                                        highlights: highSnapshot.data!,
                                      );
                                    }
                                  },
                                );
                              } else {
                                return StoreProductsTab(
                                    photocards: snapshot.data!);
                              }
                            }
                          },
                        ),
                      ],
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
