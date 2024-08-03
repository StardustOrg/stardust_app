import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard_cont.dart';
import 'package:stardust_app_skeleton/features/home/widgets/header.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              const Header(),
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 27),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    StarTexts.newProducts,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 25),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PhotocardContainer(
                      artistName: "(G)-IDLE",
                      pcName: "OT5 Photocard",
                      price: 6.66,
                    ),
                    SizedBox(width: 10),
                    PhotocardContainer(
                      artistName: "BTS",
                      pcName: "Jungkook Photocard",
                      price: 10.99,
                    ),
                    SizedBox(width: 10),
                    PhotocardContainer(
                      artistName: "BLACKPINK",
                      pcName: "Lisa Photocard",
                      price: 8.99,
                    ),
                    SizedBox(width: 10),
                    PhotocardContainer(
                      artistName: "TWICE",
                      pcName: "Lisa Photocard",
                      price: 8.99,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    StarTexts.lastUnities,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 25),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PhotocardContainer(
                      artistName: "(G)-IDLE",
                      pcName: "OT5 Photocard",
                      price: 6.66,
                    ),
                    SizedBox(width: 10),
                    PhotocardContainer(
                      artistName: "BTS",
                      pcName: "Jungkook Photocard",
                      price: 10.99,
                    ),
                    SizedBox(width: 10),
                    PhotocardContainer(
                      artistName: "BLACKPINK",
                      pcName: "Lisa Photocard",
                      price: 8.99,
                    ),
                    SizedBox(width: 10),
                    PhotocardContainer(
                      artistName: "TWICE",
                      pcName: "Lisa Photocard",
                      price: 8.99,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
