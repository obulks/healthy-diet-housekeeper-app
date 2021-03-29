import 'package:healthy_diet_housekeeper/public.dart';

class SmsApi {
  static final String baseUrl = 'http://192.168.1.101:3000/sms';

  static Future send(String phone) async {
    Dio dio = new Dio();

    dio.options.headers = {
      'content-type': 'application/json',
    };

    Map<String, dynamic> data = {
      "phone": phone,
    };

    return dio.post('$baseUrl/code', data: data).then((response) {
      print('SmsApi response: $response');
      return Sms.fromJson(response.data);
    }).catchError((err) {
      print('dio error: $err');
    });
  }
}
