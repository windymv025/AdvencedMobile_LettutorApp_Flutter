import 'package:flutter/material.dart';

abstract class BaseDTO<T> extends ChangeNotifier {
  final List<T> _items = [];
  List<T> get items => _items;
  void add(T item) {
    _items.add(item);
    notifyListeners();
  }

  void addAll(List<T> items) {
    _items.clear();
    _items.addAll(items);
    notifyListeners();
  }

  void remove(T item) {
    _items.remove(item);
    notifyListeners();
  }
}
