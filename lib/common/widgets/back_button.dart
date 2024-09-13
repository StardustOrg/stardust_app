import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';

class StarBackButton extends StatelessWidget {
  const StarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: const Row(
        children: [
          Icon(
            Icons.arrow_back_ios_new_rounded,
            color: StarColors.starBlue,
            size: 15,
          ),
          SizedBox(width: 10),
          Text(
            'Voltar',
            style: TextStyle(
              color: StarColors.starBlue,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
