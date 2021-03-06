import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_merc/models/cart_items.dart';
import 'package:projeto_merc/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]?.quantity == 1) {
      _items.remove(productId);
    } else {
      _items.update(
          productId,
          (existingItem) => CartItem(
                id: existingItem.id,
                name: existingItem.name,
                quantity: existingItem.quantity - 1,
                price: existingItem.price,
                productId: existingItem.productId,
              ));
    }
    notifyListeners();
  }

  int get itemsCount => _items.length;

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void aumentaQuantity() {
    items.forEach((key, cartItem) {
      cartItem.quantity++;
    });
    notifyListeners();
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (existingItem) => CartItem(
                id: existingItem.id,
                name: existingItem.name,
                quantity: existingItem.quantity + 1,
                price: existingItem.price,
                productId: existingItem.productId,
              ));
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
                id: Random().nextInt(10000).toString(),
                name: product.name,
                quantity: 1,
                price: product.price,
                productId: product.id,
              ));
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
