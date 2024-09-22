import 'package:shared_preferences/shared_preferences.dart';

class RecentSearchUtils {
  static const String _recentQueriesKey = 'recent_queries';
  static const String _recentTimestampsKey = 'recent_timestamps';

  /// Save a search query and timestamp to SharedPreferences.
  static Future<void> saveSearch(String query, String timestamp) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> recentQueries = prefs.getStringList(_recentQueriesKey) ?? [];
    List<String> recentTimestamps =
        prefs.getStringList(_recentTimestampsKey) ?? [];

    // Add the new search to the front (most recent).
    recentQueries.insert(0, query);
    recentTimestamps.insert(0, timestamp);

    // Limit to the most recent 5 searches.
    if (recentQueries.length > 5) recentQueries = recentQueries.sublist(0, 5);
    if (recentTimestamps.length > 5) {
      recentTimestamps = recentTimestamps.sublist(0, 5);
    }

    await prefs.setStringList(_recentQueriesKey, recentQueries);
    await prefs.setStringList(_recentTimestampsKey, recentTimestamps);
  }

  /// Retrieve the list of recent searches (queries and timestamps).
  static Future<List<Map<String, String>>> getRecentSearches() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> recentQueries = prefs.getStringList(_recentQueriesKey) ?? [];
    List<String> recentTimestamps =
        prefs.getStringList(_recentTimestampsKey) ?? [];

    List<Map<String, String>> recentSearches = [];
    for (int i = 0; i < recentQueries.length; i++) {
      recentSearches.add({
        'query': recentQueries[i],
        'timestamp': recentTimestamps.length > i ? recentTimestamps[i] : '',
      });
    }
    return recentSearches;
  }

  /// Delete a search by index.
  static Future<void> deleteSearch(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> recentQueries = prefs.getStringList(_recentQueriesKey) ?? [];
    List<String> recentTimestamps =
        prefs.getStringList(_recentTimestampsKey) ?? [];

    if (index < recentQueries.length) recentQueries.removeAt(index);
    if (index < recentTimestamps.length) recentTimestamps.removeAt(index);

    await prefs.setStringList(_recentQueriesKey, recentQueries);
    await prefs.setStringList(_recentTimestampsKey, recentTimestamps);
  }

  /// Clear all recent searches.
  static Future<void> clearRecentSearches() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_recentQueriesKey);
    await prefs.remove(_recentTimestampsKey);
  }
}
