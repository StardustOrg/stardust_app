import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';
import 'package:stardust_app_skeleton/repository/photocards_repository.dart';

class CartItem {
  final String id; // Photocard id
  int quantity;
  double price; // Adicione este campo

  CartItem({required this.id, required this.quantity, required this.price});

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'price': price, // Inclua o preço aqui
      };

  static CartItem fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      quantity: json['quantity'],
      price: json['price'], // Inclua o preço aqui
    );
  }
}


class CartProvider with ChangeNotifier {
  static const String cartKey = 'user_cart';
  List<CartItem> _cart = [];

  CartProvider() {
    loadCart();
  }

  List<CartItem> get cart => _cart;

  double get totalAmount {
    return _cart.fold(0, (total, item) => total + (item.price * item.quantity));
  }

  // Fetch the current cart from cache
  Future<void> loadCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartData = prefs.getString(cartKey);
    if (cartData != null) {
      List<dynamic> decodedData = json.decode(cartData);
      _cart = decodedData.map((item) => CartItem.fromJson(item)).toList();
    }
    notifyListeners(); // Notify listeners when loading
  }

  // Save the cart to cache
  Future<void> saveCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartData = json.encode(_cart.map((item) => item.toJson()).toList());
    await prefs.setString(cartKey, cartData);
    notifyListeners(); // Notify listeners when saving
  }

  // Add item to cart
  Future<void> addItemToCart(String productId, int quantity, double price) async {
    CartItem existingItem = _cart.firstWhere(
      (item) => item.id == productId,
      orElse: () => CartItem(id: productId, quantity: 0, price: price),
    );

    if (existingItem.quantity < 4) {
      existingItem.quantity += quantity;
    }

    if (!_cart.contains(existingItem)) {
      _cart.add(existingItem);
    }

    await saveCart();
  }

  // Remove item from cart
  // Remove item from cart
  Future<void> removeItemFromCart(String productId, int quantity) async {
    CartItem existingItem = _cart.firstWhere(
      (item) => item.id == productId,
      orElse: () => CartItem(id: productId, quantity: 0, price: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity -= quantity;
    }

    if (existingItem.quantity <= 0) {
      _cart.remove(existingItem);
    }

    await saveCart();
  }

  // Clear cart
  Future<void> clearCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(cartKey);
    _cart.clear();
    notifyListeners(); // Notify listeners when clearing
  }

  Future<List<Photocard>> fetchCartPhotocardDetails() async {
    List<String> cartIds = _cart.map((item) => item.id).toList();
    return await PhotocardsRepository.instance.getPhotocardsByIds(cartIds);
  }
}
