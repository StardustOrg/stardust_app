import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stardust_app_skeleton/common/widgets/header.dart';
import 'package:stardust_app_skeleton/common/widgets/section_title.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';
import 'package:stardust_app_skeleton/utils/local_storage/search_utils.dart';
import 'package:stardust_app_skeleton/utils/logging/logger.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, String>> _recentSearches = [];

  @override
  void initState() {
    super.initState();
    _loadRecentSearches();
  }

  void _loadRecentSearches() async {
    List<Map<String, String>> recentSearches =
        await RecentSearchUtils.getRecentSearches();
    setState(() {
      _recentSearches = recentSearches;
    });
  }

  Future<void> _deleteRecentSearch(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _recentSearches.removeAt(index);
    });

    List<String> recentQueries = prefs.getStringList('recent_queries') ?? [];
    List<String> recentTimestamps =
        prefs.getStringList('recent_timestamps') ?? [];

    if (recentQueries.length > index) recentQueries.removeAt(index);
    if (recentTimestamps.length > index) recentTimestamps.removeAt(index);

    await prefs.setStringList('recent_queries', recentQueries);
    await prefs.setStringList('recent_timestamps', recentTimestamps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 40),
              const SectionTitle(
                title: 'BUSCAS RECENTES',
                color: StarColors.starBlue,
              ),
              const SizedBox(height: 5),
              if (_recentSearches.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _recentSearches.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                StarLoggerHelper.debug(
                                    'Recent search clicked: ${_recentSearches[index]['query']}');
                              },
                              child: Container(
                                width: StarDeviceUtils.getScreenWidth(context) *
                                    0.7,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  _recentSearches[index]['query'] ?? '',
                                  style: const TextStyle(
                                    color: StarColors.textSecondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await RecentSearchUtils.deleteSearch(index);
                                setState(() {
                                  _recentSearches.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.close_rounded,
                                color: StarColors.textSecondary,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              else
                const Text(
                  'Nenhuma busca recente',
                  style: TextStyle(
                    fontSize: 16,
                    color: StarColors.textSecondary,
                  ),
                ),
              const SizedBox(height: 30),
              const SectionTitle(
                title: 'Tags em alta',
                color: StarColors.starBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
