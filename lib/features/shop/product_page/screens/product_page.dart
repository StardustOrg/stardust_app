import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/back_button.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/star_tag.dart';
import 'package:stardust_app_skeleton/features/shop/product_page/widgets/pc_images.dart';
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

  int _selectedQuantity = 1; // Default selected quantity

  // List of quantities (can be integers or strings)
  final List<int> _quantities = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(),
                    Text(
                      "Nome Grupo",
                      style: TextStyle(
                        color: StarColors.textSecondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Nome Artista",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0,
                        color: StarColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Nome Photocard dasbas",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 0,
                        color: StarColors.textPrimary,
                      ),
                    ),
                  ],
                ),
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
                    DropdownButton<int>(
                      value: _selectedQuantity, // The current selected quantity
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      onChanged: (int? newValue) {
                        setState(() {
                          _selectedQuantity =
                              newValue!; // Update the selected quantity
                        });
                      },
                      items:
                          _quantities.map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value
                              .toString()), // Display the value in the dropdown
                        );
                      }).toList(),
                      // Displaying the selected value in the format "Quantidade: value"
                      selectedItemBuilder: (BuildContext context) {
                        return _quantities.map<Widget>((int value) {
                          return Text(
                              'Quantidade: $value'); // Format the selected item display
                        }).toList();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
