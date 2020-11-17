import 'package:flutter/material.dart';

class Store extends ChangeNotifier {
  int _count = 0;
  String _query = '';

  get count => _count;

  addCount() {
    _count++;
    notifyListeners();
  }
  subCount() {
    _count--;
    notifyListeners();
  }

  updateQueryString(String newQuery) {
    _query = newQuery;
    notifyListeners();
  }

  getQueryString() {
    return _query;
  }
}
