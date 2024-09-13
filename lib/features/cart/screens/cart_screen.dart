import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/common/widgets/images/photocard_image.dart';
import 'package:stardust_app_skeleton/features/shop/store_page/screens/store_page.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/image_string.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cart = [
    {
      'store_name': "Loja 1",
      'store_id': "dadsa",
      'items': [
        {
          "group_name": "(G)-IDLE",
          "artist_name": "(G)-IDLE",
          "pc_name": "OT5 Photocard",
          "price": 6.66,
          "id": "1",
          "image_url": "https://i.pinimg.com/originals/7b/7b/7b/",
          "quantity": 1,
        },
        {
          "group_name": "(G)-IDLE",
          "artist_name": "(G)-IDLE",
          "pc_name": "OT5 Photocard",
          "price": 6.66,
          "id": "1",
          "image_url": "https://i.pinimg.com/originals/7b/7b/7b/",
          "quantity": 5,
        },
      ]
    },
    {
      'store_name': "Loja 2",
      'store_id': "dadsa",
      'items': [
        {
          "group_name": "(G)-IDLE",
          "artist_name": "(G)-IDLE",
          "pc_name": "OT5 Photocard",
          "price": 6.66,
          "id": "1",
          "image_url": "https://i.pinimg.com/originals/7b/7b/7b/",
          "quantity": 1,
        },
      ]
    },
  ];

  double total = 275.2;
  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(bottom: 75),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> store = cart[index];
                  bool isLast = index == cart.length - 1;
                  bool isFirst = index == 0;
                  return Column(
                    children: [
                      if (isFirst) const SizedBox(height: 15),
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
                            onTap: () => Get.to(
                              () => StorePage(
                                storeId: store['store_id'],
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  store['store_name'],
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
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: store['items'].length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> item = store['items'][index];
                          return Container(
                            margin: index == store['items'].length - 1
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StarPhotocardImage(
                                      borderColor: StarColors.grey,
                                      size: StarDeviceUtils.getScreenWidth(
                                              context) *
                                          0.3,
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      height: StarDeviceUtils.getScreenWidth(
                                              context) *
                                          0.3 *
                                          1.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item['group_name'],
                                                style: const TextStyle(
                                                  color:
                                                      StarColors.textSecondary,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  height: 0,
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                item['artist_name'],
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                  color: StarColors.textPrimary,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                item['pc_name'],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                  color: StarColors.textPrimary,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            // width: 5,
                                            // height: 5,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 1,
                                                    color: StarColors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    item['quantity'] > 1
                                                        ? Icons.remove_rounded
                                                        : Icons.delete_rounded,
                                                    color: StarColors.grey,
                                                    size: 18,
                                                  ),
                                                ),
                                                Text(
                                                  item['quantity'].toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                    color: StarColors.grey,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.add_rounded,
                                                    color: StarColors.grey,
                                                    size: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
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
                      if (!isLast)
                        const Divider(
                          color: StarColors.grey,
                          thickness: 0.5,
                        ),
                    ],
                  );
                },
              ),
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
                        UtilBrasilFields.obterReal(total),
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
