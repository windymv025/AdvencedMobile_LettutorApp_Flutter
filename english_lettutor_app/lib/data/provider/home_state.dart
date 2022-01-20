import 'package:flutter/cupertino.dart';

class HomeState extends ChangeNotifier {
  final List<String> titles = [
    "Home",
    "Schedule",
    "Teachers",
    "Courses",
  ];
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
