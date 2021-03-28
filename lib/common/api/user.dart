import 'dart:io';
import 'package:dio/dio.dart';

class UserApi {
  // static final String baseUrl = 'http://192.168.1.101:3000';
  static final String baseUrl = 'http://api.obulks.com';

  static Future login() async {
    Dio dio = new Dio();
    dio.options.headers = {
      'content-type': 'application/json',
    };
    dio.get('$baseUrl').then((response) {
      print('response: $response');
      return response;
    }).catchError((err) {
      print('dio error: $err');
    });
  }
}
