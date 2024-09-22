import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/features/cart/screens/cart_screen.dart';
import 'package:stardust_app_skeleton/features/shop/Search/screens/search.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:stardust_app_skeleton/utils/logging/logger.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For cache

class Header extends StatefulWidget {
  const Header({
    super.key,
    this.goToSearchPage = false,
  });

  final bool goToSearchPage;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final TextEditingController _searchController = TextEditingController();
  final String quantity = '3';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _saveToCache(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> recentQueries = prefs.getStringList('recent_queries') ?? [];
    List<String> recentTimestamps =
        prefs.getStringList('recent_timestamps') ?? [];

    // Insert the new search at the beginning of the lists
    recentQueries.insert(0, value);
    recentTimestamps.insert(0, DateTime.now().toString());

    // Keep only the most recent 5
    if (recentQueries.length > 5) {
      recentQueries = recentQueries.sublist(0, 5);
      recentTimestamps = recentTimestamps.sublist(0, 5);
    }

    await prefs.setStringList('recent_queries', recentQueries);
    await prefs.setStringList('recent_timestamps', recentTimestamps);
  }

  void _handleSearch() {
    final String searchText = _searchController.text;
    if (searchText.isNotEmpty) {
      _saveToCache(searchText);
      StarLoggerHelper.debug('Search button clicked with query: $searchText');
    } else {
      StarLoggerHelper.debug('Search field is empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _searchController,
              onFieldSubmitted: (value) {
                if (value.isNotEmpty && !widget.goToSearchPage) {
                  _saveToCache(value);
                  StarLoggerHelper.debug('Search submitted with query: $value');
                }
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              onTap: () {
                StarLoggerHelper.debug('Search field tapped');
                if (widget.goToSearchPage) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                }
              },
              decoration: InputDecoration(
                hintText: StarTexts.searchLabel,
                suffixIcon: IconButton(
                  onPressed: !widget.goToSearchPage ? _handleSearch : () {},
                  icon: const Icon(Icons.search_rounded),
                ),
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
            position: badges.BadgePosition.topEnd(top: -1, end: -1),
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
            child: IconButton(
              onPressed: () => Get.to(() => const CartScreen()),
              icon: const Icon(
                Icons.shopping_cart_rounded,
                color: StarColors.grey,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
