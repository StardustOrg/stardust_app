import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocard_cont.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: StarColors.grey),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.filter_alt_rounded,
                      size: 15,
                      color: StarColors.grey,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Filtros',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: StarColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: (0.55),
            children: photocards.map((photocard) {
              return Center(
                child: PhotocardContainer(
                  artistName: photocard.artistName,
                  pcName: photocard.pcName,
                  id: photocard.id,
                  price: photocard.price,
                  size: StarDeviceUtils.getScreenWidth(context) * 0.41,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
