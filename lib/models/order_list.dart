import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:projeto_merc/models/cart.dart';
import 'package:projeto_merc/models/oder.dart';

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items => [..._items];

  int get itemsCounts {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
        0,
        Order(
          id: Random().nextInt(10000).toString(),
          amount: cart.totalAmount,
          products: cart.items.values.toList(),
          dateTime: DateTime.now(),
        ));
    notifyListeners();
  }
}
