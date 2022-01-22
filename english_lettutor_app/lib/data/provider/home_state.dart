import 'package:firebase_analytics/firebase_analytics.dart';
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
    FirebaseAnalytics.instance.logEvent(name: "page_change", parameters: {
      "page_index": index,
      "page_title": titles[index],
    });

    _pageIndex = index;
    notifyListeners();
  }
}
