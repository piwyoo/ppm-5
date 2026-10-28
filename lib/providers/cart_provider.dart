import 'package:flutter/material.dart';

import '../models/book.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get totalItems {
    int total = 0;
    _items.forEach((key, item) {
      total += item.quantity;
    });
    return total;
  }

  double get totalPrice {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.book.price * item.quantity;
    });
    return total;
  }

  void addItem(Book book) {
    if (_items.containsKey(book.id)) {
      _items.update(
        book.id,
        (existing) =>
            CartItem(book: existing.book, quantity: existing.quantity + 1),
      );
    } else {
      _items.putIfAbsent(book.id, () => CartItem(book: book));
    }
    notifyListeners();
  }

  void removeItem(String bookId) {
    if (!_items.containsKey(bookId)) return;

    if (_items[bookId]!.quantity > 1) {
      _items.update(
        bookId,
        (existing) =>
            CartItem(book: existing.book, quantity: existing.quantity - 1),
      );
    } else {
      _items.remove(bookId);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
