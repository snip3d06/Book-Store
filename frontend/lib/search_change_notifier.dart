import 'package:flutter/cupertino.dart';

class SearchChangeNotifier extends ChangeNotifier {
  String _search = '';

  void search(String value) {
    _search = value;
    notifyListeners();
  }

  String get searchText => _search;
}
