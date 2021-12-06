import 'package:english_lettutor_app/models/page/paging_info.dart';
import 'package:flutter/material.dart';

abstract class BaseDTO<T> extends ChangeNotifier {
  List<T> _items = [];
  final List<T> _itemsBackup = [];

  PagingInfo pagingInfo = PagingInfo(12, 0);
  int get totalPage => pagingInfo.totalPage;
  int get currentPage => pagingInfo.currentPage;

  List<T> get items => _items;
  set items(List<T> items) {
    _items = items;
    notifyListeners();
  }

  void add(T item) {
    _items.add(item);
    _itemsBackup.add(item);
    pagingInfo = PagingInfo(12, _items.length);
    notifyListeners();
  }

  void addAll(List<T> items) {
    _items.clear();
    _items.addAll(items);
    sort();
    getAvailableItems();

    if (_itemsBackup.isEmpty) {
      _itemsBackup.addAll(items);
    }

    pagingInfo = PagingInfo(12, _items.length);
    notifyListeners();
  }

  void remove(T item) {
    _items.remove(item);
    _itemsBackup.remove(item);
    pagingInfo = PagingInfo(12, _items.length);
    notifyListeners();
  }

  void clearSearch() {
    _items.clear();
    _items.addAll(_itemsBackup);
    pagingInfo = PagingInfo(12, _items.length);
    notifyListeners();
  }

  List<T> getAll() {
    return _items;
  }

  List<T> getItemInPage(int page) {
    if (pagingInfo.totalPage > 0) {
      if (page > pagingInfo.totalPage) page = 1;
      if (page < 1) page = pagingInfo.totalPage;

      pagingInfo.currentPage = page;

      return _items
          .skip((page - 1) * pagingInfo.itemInPerPage)
          .take(pagingInfo.itemInPerPage)
          .toList();
    } else {
      pagingInfo.currentPage = 0;
      return [];
    }
  }

  List<T> getItemInCurrentPage() {
    return getItemInPage(pagingInfo.currentPage);
  }

  void nextPage() {
    if (pagingInfo.currentPage < pagingInfo.totalPage) {
      pagingInfo.currentPage++;
      notifyListeners();
    }
  }

  void prevPage() {
    if (pagingInfo.currentPage > 1) {
      pagingInfo.currentPage--;
      notifyListeners();
    }
  }

  void sort() {}

  void getAvailableItems() {}
}
