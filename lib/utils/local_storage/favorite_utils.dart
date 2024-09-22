import 'package:shared_preferences/shared_preferences.dart';

class FavoritesUtils {
  static const String _favoritesKey = 'favorite_product_ids';

  /// Save a product ID to favorites.
  static Future<void> addFavorite(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> favoriteIds = prefs.getStringList(_favoritesKey) ?? [];

    if (!favoriteIds.contains(productId)) {
      favoriteIds.add(productId);
      await prefs.setStringList(_favoritesKey, favoriteIds);
    }
  }

  /// Remove a product ID from favorites.
  static Future<void> removeFavorite(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> favoriteIds = prefs.getStringList(_favoritesKey) ?? [];

    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
      await prefs.setStringList(_favoritesKey, favoriteIds);
    }
  }

  /// Retrieve the list of favorite product IDs.
  static Future<List<String>> getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  /// Check if a product ID is in favorites.
  static Future<bool> isFavorite(String productId) async {
    final List<String> favoriteIds = await getFavorites();
    return favoriteIds.contains(productId);
  }

  /// Clear all favorites.
  static Future<void> clearFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoritesKey);
  }
}
