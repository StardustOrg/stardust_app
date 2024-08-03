import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 28),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: StarTexts.searchLabel,
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Ação ao clicar no ícone do carrinho
            },
          ),
        ],
      ),
    );
  }
}
