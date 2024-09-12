import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/back_button.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/star_tag.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/pc_description.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/pc_images.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/pc_info.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/quantity_dropdown.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/type_tag.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';

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

  // int _selectedQuantity = 1; // Default selected quantity

  // List of quantities (can be integers or strings)
  final List<int> _quantities = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 50),
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
            ],
          ),
        ),
      ),
    );
  }
}
