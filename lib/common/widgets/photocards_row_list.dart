import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard_cont.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';

class PhotocardsRowList extends StatelessWidget {
  final String title;
  final List<Photocard> photocards;

  const PhotocardsRowList({
    super.key,
    required this.title,
    required this.photocards,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: photocards.map((photocard) {
              return Row(
                children: [
                  PhotocardContainer(
                    artistName: photocard.artistName,
                    pcName: photocard.pcName,
                    price: photocard.price,
                  ),
                  const SizedBox(width: 10),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
