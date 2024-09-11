import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';
import 'package:badges/badges.dart' as badges;

class Header extends StatelessWidget {
  const Header({super.key});

  final String quantity = '3';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: StarTexts.searchLabel,
                suffixIcon: Icon(Icons.search),
              ).copyWith(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 19,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          badges.Badge(
            showBadge: true,
            ignorePointer: false,
            onTap: () {
              print("object");
            },
            position: badges.BadgePosition.topEnd(top: -12, end: -12),
            badgeAnimation: const badges.BadgeAnimation.slide(
              animationDuration: Duration(milliseconds: 500),
              colorChangeAnimationDuration: Duration(seconds: 1),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            badgeContent: Text(
              quantity,
              style: const TextStyle(color: StarColors.bgLight),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: StarColors.starBlue,
              padding: EdgeInsets.all(5),
              elevation: 0,
            ),
            child: const Icon(
              Icons.shopping_cart,
              color: StarColors.grey,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
