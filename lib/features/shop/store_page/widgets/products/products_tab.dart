import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard/photocard_cont.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class StoreProductsTab extends StatefulWidget {
  const StoreProductsTab({super.key, required this.photocards});
  final List<Photocard> photocards;

  @override
  State<StoreProductsTab> createState() => _StoreProductsTabState();
}

class _StoreProductsTabState extends State<StoreProductsTab> {
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
            children: widget.photocards.map((photocard) {
              return Center(
                child: PhotocardContainer(
                  artistName: photocard.artistName,
                  pcName: photocard.pcName,
                  id: photocard.id,
                  price: photocard.price,
                  size: StarDeviceUtils.getScreenWidth(context) * 0.41,
                  imageUrl: photocard.imageUrl,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
