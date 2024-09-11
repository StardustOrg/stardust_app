import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard_cont.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/photocards_row_list.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Photocard> photocards = [
      Photocard(artistName: "(G)-IDLE", pcName: "OT5 Photocard", price: 6.66),
      Photocard(artistName: "BTS", pcName: "Jungkook Photocard", price: 10.99),
      Photocard(artistName: "BLACKPINK", pcName: "Lisa Photocard", price: 8.99),
      Photocard(artistName: "TWICE", pcName: "Lisa Photocard", price: 8.99),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              const Header(),
              const SizedBox(height: 28),
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 27),
              PhotocardsRowList(
                title: StarTexts.newProducts,
                photocards: photocards,
                detailColor: StarColors.starBlue,
              ),
              const SizedBox(height: 25),
              PhotocardsRowList(
                title: StarTexts.lastUnities,
                photocards: photocards,
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
