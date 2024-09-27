import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stardust_app_skeleton/common/widgets/images/photocard_image.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/screens/store_page.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';
import 'package:stardust_app_skeleton/utils/local_storage/cart_utils.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<List<Photocard>> _cartPhotocardsFuture;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cart;
    _cartPhotocardsFuture = cartProvider.fetchCartPhotocardDetails();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: StarColors.bgLight,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: StarColors.starBlue,
            size: 20,
          ),
        ),
        title: Row(
          children: [
            const Text(
              'SEU CARRINHO',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(width: 5),
            SvgPicture.asset(StarImages.sparkles)
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: FutureBuilder<List<Photocard>>(
              future: _cartPhotocardsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: StarDeviceUtils.getScreenHeight(context) * 0.35),
                    child:
                        const Center(child: Text('Seu carrinho está vazio!')),
                  );
                } else {
                  List<Photocard> photocards = snapshot.data!;

                  Map<String, List<Photocard>> groupedByStore = {};
                  for (var photocard in photocards) {
                    if (!groupedByStore.containsKey(photocard.storeId)) {
                      groupedByStore[photocard.storeId] = [];
                    }
                    groupedByStore[photocard.storeId]!.add(photocard);
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: groupedByStore.keys.length,
                    itemBuilder: (context, storeIndex) {
                      final storeId = groupedByStore.keys.elementAt(storeIndex);
                      final storePhotocards = groupedByStore[storeId]!;
                      final storeName = storePhotocards.first.storeName;
                      bool isLastStore =
                          storeIndex == groupedByStore.keys.length - 1;
                      bool isFirstStore = storeIndex == 0;

                      return Column(
                        children: [
                          if (isFirstStore) const SizedBox(height: 15),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.check_box_outline_blank_rounded,
                                  color: StarColors.grey,
                                ),
                                iconSize: 20,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StorePage(
                                      storeId: storeId,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      storeName,
                                      style: const TextStyle(
                                        color: StarColors.textSecondary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: StarColors.textSecondary,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: storePhotocards.length,
                            itemBuilder: (context, pcIndex) {
                              final photocard = storePhotocards[pcIndex];
                              final cartItem = cartItems.firstWhere(
                                  (item) => item.id == photocard.id);
                              final quantity = cartItem.quantity;
                              return Container(
                                margin: pcIndex == storePhotocards.length - 1
                                    ? null
                                    : const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.check_box_outline_blank_rounded,
                                        color: StarColors.grey,
                                      ),
                                      iconSize: 20,
                                    ),
                                    const SizedBox(width: 15),
                                    Row(
                                      children: [
                                        StarPhotocardImage(
                                          borderColor: StarColors.grey,
                                          size: StarDeviceUtils.getScreenWidth(
                                                  context) *
                                              0.3,
                                          imageUrl: photocard.imageUrl,
                                        ),
                                        const SizedBox(width: 10),
                                        SizedBox(
                                          width: StarDeviceUtils.getScreenWidth(
                                                  context) *
                                              0.3 *
                                              1.4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    photocard.artistName,
                                                    style: const TextStyle(
                                                      color: StarColors
                                                          .textSecondary,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 2),
                                                  Text(
                                                    photocard.memberName != ''
                                                        ? photocard.memberName!
                                                        : photocard.artistName,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                      color: StarColors
                                                          .textPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    photocard.pcName,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 0,
                                                      color: StarColors
                                                          .textPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    UtilBrasilFields.obterReal(
                                                        photocard.price),
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 0,
                                                      color: StarColors
                                                          .textPrimary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        width: 1,
                                                        color: StarColors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                  ),
                                                ),
                                                child: (photocard.quantity > 0)
                                                    ? Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          IconButton(
                                                            onPressed: () {
                                                              cartProvider
                                                                  .removeItemFromCart(
                                                                      photocard
                                                                          .id,
                                                                      1);
                                                            },
                                                            icon: Icon(
                                                              quantity > 1
                                                                  ? Icons
                                                                      .remove_rounded
                                                                  : Icons
                                                                      .delete_rounded,
                                                              color: StarColors
                                                                  .grey,
                                                              size: 18,
                                                            ),
                                                          ),
                                                          Text(
                                                            quantity.toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 0,
                                                              color: StarColors
                                                                  .grey,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              cartProvider
                                                                  .addItemToCart(
                                                                      photocard
                                                                          .id,
                                                                      1,
                                                                      photocard
                                                                          .price);
                                                            },
                                                            icon: const Icon(
                                                              Icons.add_rounded,
                                                              color: StarColors
                                                                  .grey,
                                                              size: 18,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : const Text(
                                                        'Esgotado',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height: 0,
                                                          color:
                                                              StarColors.grey,
                                                        ),
                                                      ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          if (!isLastStore)
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Divider(
                                color: StarColors.grey,
                                thickness: 0.5,
                              ),
                            ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  Row(
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        UtilBrasilFields.obterReal(cartProvider.totalAmount),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 5,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Finalizar Compra"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
