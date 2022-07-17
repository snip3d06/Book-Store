import 'package:flutter/material.dart';

class Filters extends ChangeNotifier {
  String text = '';

  void setText(String text) {
    this.text = text;
    notifyListeners();
  }
}
