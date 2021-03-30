import 'package:healthy_diet_housekeeper/public.dart';

class UserApi {
  static final String _baseUrl = 'http://192.168.1.101:3000/users';

  static Future login(String phone, String code) async {
    Dio dio = new Dio();

    dio.options.headers = {
      'content-type': 'application/json',
    };

    Map<String, dynamic> data = {
      "phone": phone,
      "code": code,
    };
    return dio.post('$_baseUrl/login', data: data).then((response) {
      print('UserApi response: $response');
      return Login.fromJson(response.data);
    }).catchError((err) {
      // print('dio error: $err');
      Toast.show('请求错误：服务器维护中，登录失败');
    });
  }
}
