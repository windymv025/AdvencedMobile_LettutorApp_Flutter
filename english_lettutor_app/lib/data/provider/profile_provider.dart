import 'package:english_lettutor_app/models/profile/profile.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  bool _isChanged = false;
  bool get isChanged => _isChanged;
  set isChanged(value) {
    _isChanged = value;
    notifyListeners();
  }

  late String _fullName;
  String get fullName => _fullName;
  set fullName(String value) {
    _fullName = value;
    notifyListeners();
  }

  late String? _country;
  String? get country => _country;
  set country(String? value) {
    _country = value;
    notifyListeners();
  }

  late String? _phone;
  String? get phone => _phone;
  set phone(String? value) {
    _phone = value;
    notifyListeners();
  }

  late DateTime? _birthday;
  DateTime? get birthday => _birthday;
  set birthday(DateTime? value) {
    _birthday = value;
    notifyListeners();
  }

  String? _level;
  String? get level => _level;
  set level(String? value) {
    _level = value;
    notifyListeners();
  }

  List<String> wantToLearn = [];
}
