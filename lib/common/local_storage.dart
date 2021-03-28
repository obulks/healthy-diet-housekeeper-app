import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future set<T>(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      switch (T) {
        case String:
          sp.setString(key, value);
          break;
        case bool:
          sp.setBool(key, value);
          break;
        case double:
          // +.0 是为了将int转为double，防止程序中断
          sp.setDouble(key, value + .0);
          break;
        default:
          sp.setString(key, value);
          break;
      }
    } catch (e) {
      print('type error: local_storage.dart. $e');
    }
  }

  Future get(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.get(key);
  }

  Future clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
