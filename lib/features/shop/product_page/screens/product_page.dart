import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/back_button.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocards_row_list.dart';
import 'package:stardust_app_skeleton/common/widgets/star_tag.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/pc_description.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/pc_images.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/pc_info.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/quantity_dropdown.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/store_card.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/type_tag.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id});

  final String id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> topics = [
    "Season’s Greetings 2024",
    "Tag",
    "Tag",
    "Tag",
    "Tag",
  ];

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

  double rating = 4.5;

  // int _selectedQuantity = 1; // Default selected quantity

  // List of quantities (can be integers or strings)
  final List<int> _quantities = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  const Header(),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StarBackButton(),
                        PcTypeTag(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const PhotocardImagesCont(
                    mainImage: "mainImage",
                    dt1: "dt1",
                    dt2: "dt2",
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: topics.map((topic) {
                        return Row(
                          children: [
                            StarTag(topic: topic),
                            const SizedBox(width: 8),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const PhotocardInformation(
                    artistName: "STACY",
                    pcName: "OT6 Photocard adsaa",
                    groupName: "STACY",
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          UtilBrasilFields.obterReal(66.66),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: StarColors.textPrimary,
                          ),
                        ),
                        DropdownQuantitySelector(
                          quantities: _quantities,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const PhotocardDescription(
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ullamcorper lorem in nibh posuere maximus. Aliquam erat volutpat. Etiam fringilla vulputate purus, ut mattis libero vestibulum a. Proin ligula ex, venenatis ut consequat non, consectetur porta velit. Vestibulum tincidunt quam et nulla euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ullamcorper lorem in nibh posuere maximus. Aliquam erat volutpat. Etiam fringilla vulputate purus, ut mattis libero vestibulum a. Proin ligula ex, venenatis ut consequat non, consectetur porta velit. Vestibulum tincidunt quam et nulla euismod",
                  ),
                  const SizedBox(height: 25),
                  StoreCard(
                      rating: rating, storeName: "Store Name", storeId: "1"),
                  const SizedBox(height: 25),
                  PhotocardsRowList(
                    title: StarTexts.productRecommendations,
                    photocards: photocards,
                    detailColor: StarColors.starBlue,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: StarColors.bgLight,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, -1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_shopping_cart_rounded,
                        color: StarColors.black,
                      ),
                    ),
                    SizedBox(
                      width: StarDeviceUtils.getScreenWidth(context) * 0.6,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Comprar"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
