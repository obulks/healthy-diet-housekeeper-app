import 'package:healthy_diet_housekeeper/public.dart';

class SmsApi {
  static final String _baseUrl = '${Api.baseUrl}/sms';

  static Future<Sms> send(String phone) async {
    Dio dio = new Dio();

    dio.options.headers = {
      'content-type': 'application/json',
    };

    Map<String, dynamic> data = {
      "phone": phone,
    };

    return dio.post('$_baseUrl/code', data: data).then((response) {
      print('SmsApi response: $response');
      return Sms.fromJson(response.data);
    }).catchError((err) {
      // print('dio error: $err');
      Toast.show('请求错误：服务器维护中，短信发送失败');
    });
  }
}
