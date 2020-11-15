import 'package:flutter/material.dart';

class LocalStore extends ChangeNotifier {
  int _count = 0;

  get count => _count;

  addCount() {
    _count++;
    notifyListeners();
  }
  subCount() {
    _count--;
    notifyListeners();
  }
}
