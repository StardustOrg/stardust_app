import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/artist_card.dart';
import 'package:stardust_app_skeleton/common/widgets/back_button.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/tabs_row.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/widgets/highlights/highlights_tab.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/widgets/products/products_tab.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/widgets/store_card_info.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key, required this.storeId});

  final String storeId;

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final String storeName = "K4TOWN";
  final String place = "Belo Horizonte, Minas Gerais";
  final double rating = 4.5;
  final String insta = "@k4town.oficial";

  bool tab1 = true;

  void _updateTab(bool isTab1) {
    setState(() {
      tab1 = isTab1;
    });
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
              const ArtistCard(imageUrl: "imageUrl"),
              const SizedBox(height: 30),
              StoreCardInfo(
                storeName: storeName,
                rating: rating,
                place: place,
                insta: insta,
              ),
              const SizedBox(height: 35),
              TabsRow(
                tab1: tab1,
                onTabChanged: _updateTab,
              ),
              const SizedBox(height: 30),
              if (tab1) const StoreHighlightsTab(),
              if (!tab1) const StoreProductsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
