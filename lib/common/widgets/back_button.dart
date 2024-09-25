import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';

class StarBackButton extends StatelessWidget {
  const StarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.none,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        highlightColor: StarColors.starBlue.withOpacity(0.25),
        onTap: () => Get.back(),
        child: Container(
          padding: const EdgeInsets.all(2.0),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
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
        ),
      ),
    );
  }
}
