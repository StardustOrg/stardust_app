import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class TabsRow extends StatelessWidget {
  final bool tab1;
  final ValueChanged<bool> onTabChanged;

  const TabsRow({
    super.key,
    required this.tab1,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => onTabChanged(true),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: StarDeviceUtils.getScreenWidth(context) * 0.5,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: tab1 ? StarColors.starPink : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 18,
                fontWeight: tab1 ? FontWeight.bold : FontWeight.w300,
                color: StarColors.textPrimary,
              ),
              child: const Text(
                "Destaques",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onTabChanged(false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: StarDeviceUtils.getScreenWidth(context) * 0.5,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: tab1 ? Colors.transparent : StarColors.starPink,
                  width: 2,
                ),
              ),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 18,
                fontWeight: tab1 ? FontWeight.w300 : FontWeight.bold,
                color: StarColors.textPrimary,
              ),
              child: const Text(
                "Produtos",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
