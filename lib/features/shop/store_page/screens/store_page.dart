import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/artist_card.dart';
import 'package:stardust_app_skeleton/common/widgets/back_button.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/tabs_row.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/widgets/highlights/highlights_tab.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/widgets/products/products_tab.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/widgets/store_card_info.dart';
import 'package:stardust_app_skeleton/models/store.dart';
import 'package:stardust_app_skeleton/repository/store_repository.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key, required this.storeId});

  final String storeId;

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late Future<Store> _storeFuture;
  final StoreRepository _storeRepository = StoreRepository.instance;

  bool tab1 = true;

  void _updateTab(bool isTab1) {
    setState(() {
      tab1 = isTab1;
    });
  }

  @override
  void initState() {
    super.initState();
    _storeFuture = _fetchStore();
  }

  Future<Store> _fetchStore() async {
    return await _storeRepository.getStoreById(widget.storeId);
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
                        StoreCardInfo(
                          storeName: store.name,
                          rating: 0,
                          place: "Unknown location",
                          insta: store.insta ?? "",
                          icon: store.icon,
                        ),
                        const SizedBox(height: 35),
                        TabsRow(
                          tab1: tab1,
                          onTabChanged: _updateTab,
                        ),
                        const SizedBox(height: 30),
                        if (tab1) StoreHighlightsTab(),
                        if (!tab1) StoreProductsTab(),
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
