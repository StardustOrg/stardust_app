import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stardust_app_skeleton/utils/logging/logger.dart';

class CartItem {
  final String id; // Photocard id
  int quantity;

  CartItem({required this.id, required this.quantity});

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
      };

  static CartItem fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      quantity: json['quantity'],
    );
  }
}

class CartService extends ChangeNotifier {
  static const String cartKey = 'user_cart';
  List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;
  int get itemCount => _cart.length;

  // Fetch the current cart from cache
  Future<void> loadCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartData = prefs.getString(cartKey);
    if (cartData != null) {
      List<dynamic> decodedData = json.decode(cartData);
      _cart = decodedData.map((item) => CartItem.fromJson(item)).toList();
    }
    notifyListeners(); // Notify listeners that the cart has changed
  }

  // Save the cart to cache
  Future<void> saveCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartData = json.encode(_cart.map((item) => item.toJson()).toList());
    await prefs.setString(cartKey, cartData);
  }

  // Add item to cart
  Future<void> addItemToCart(String productId, int quantity) async {
    CartItem? existingItem = _cart.firstWhere(
      (item) => item.id == productId,
      orElse: () => CartItem(id: productId, quantity: 0),
    );

    if (existingItem.quantity < 4) {
      existingItem.quantity += quantity;
    }

    if (!_cart.contains(existingItem)) {
      _cart.add(existingItem);
    }

    await saveCart();
    notifyListeners(); // Notify listeners that the cart has changed
    StarLoggerHelper.info(
        'Photocard ($productId): Added $quantity items to cart');
  }

  // Remove item from cart
  Future<void> removeItemFromCart(String productId) async {
    _cart.removeWhere((item) => item.id == productId);
    await saveCart();
    notifyListeners(); // Notify listeners that the cart has changed
  }

  // Clear cart
  Future<void> clearCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(cartKey);
    _cart.clear();
    notifyListeners(); // Notify listeners that the cart has changed
  }

  // Get the total quantity of items in the cart
  int getTotalItems() {
    return _cart.fold<int>(0, (total, item) => total + item.quantity);
  }
}
