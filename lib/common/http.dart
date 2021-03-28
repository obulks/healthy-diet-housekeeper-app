import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Http {
  String _baseUrl = 'http://localhost:3000';

  static Future get() async {
    try {
      Dio dio = new Dio();
      dio.options = new BaseOptions(

      );
      Response response = await Dio().get("http://www.google.com");
      return response;
    } catch (e) {
      print(e);
    }
  }

  static Future post() async {}
  static Future delete() async {}
  static Future put() async {}
}
