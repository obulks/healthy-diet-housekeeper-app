import 'package:healthy_diet_housekeeper/public.dart';

class NewsApi {
  static final String _baseUrl = 'http://192.168.1.101:3000/news';

  static Future<NewsDetail> getContent(String uniquekey) async {
    Dio dio = new Dio();

    Map<String, dynamic> query = {
      'uniquekey': uniquekey,
    };

    return dio
        .get('$_baseUrl/content', queryParameters: query)
        .then((response) {
      print('response: $response');
      return NewsDetail.fromJson(response.data);
    }).catchError((err) {
      print('dio error: $err');
      Toast.show('获取数据失败');
    });
  }
}
