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
import 'package:stardust_app_skeleton/repository/photocards_repository.dart';
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
  late Future<Photocard> _photocardFuture;
  late Future<List<Photocard>> _photocardsFuture;
  final PhotocardsRepository _photocardRepository =
      PhotocardsRepository.instance;

  List<String> topics = [
    "Season’s Greetings 2024",
    "Tag",
    "Tag",
    "Tag",
    "Tag",
  ];

  Future<List<Photocard>> _fetchPhotocards() async {
    return await _photocardRepository.getAllPhotocards(limit: 10);
  }

  Future<Photocard> _fetchPhotocard() async {
    return await _photocardRepository.getPhotocardById(widget.id);
  }

  @override
  void initState() {
    super.initState();
    _photocardsFuture = _fetchPhotocards();
    _photocardFuture = _fetchPhotocard();
  }

  double rating = 4.5;

  // int _selectedQuantity = 1; // Default selected quantity

  // List of quantities (can be integers or strings)
  final List<int> _quantities = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                  FutureBuilder<Photocard>(
                    future: _photocardFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData) {
                        return const Center(child: Text('No data found'));
                      } else {
                        final photocard = snapshot.data!;
                        return Column(
                          children: [
                            PhotocardImagesCont(
                              mainImage: photocard.imageUrl,
                              dt1: "",
                              dt2: "",
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
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
                            PhotocardInformation(
                              artistName: photocard.memberName,
                              pcName: photocard.pcName,
                              groupName: photocard.artistName,
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    UtilBrasilFields.obterReal(photocard.price),
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
                            PhotocardDescription(
                              description: photocard.description,
                            ),
                            const SizedBox(height: 25),
                            StoreCard(
                              rating: rating,
                              storeName: photocard.storeName,
                              storeId: photocard.storeId,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  FutureBuilder<List<Photocard>>(
                    future: _photocardsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('No recommendations found'));
                      } else {
                        final photocards = snapshot.data!;
                        return PhotocardsRowList(
                          title: StarTexts.productRecommendations,
                          photocards: photocards,
                          detailColor: StarColors.starBlue,
                        );
                      }
                    },
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
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 5,
                          ),
                        ),
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
