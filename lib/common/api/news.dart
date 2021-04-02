import 'package:healthy_diet_housekeeper/public.dart';

class NewsApi {
  static final String _baseUrl = 'http://192.168.1.101:3000/news';

  static Future<NewsList> getNewsList(int page, int pageSize) {
    Dio dio = new Dio();

    Map<String, dynamic> query = {
      'page': page,
      'page_size': pageSize,
    };

    return dio.get('$_baseUrl/', queryParameters: query).then((response) {
      return NewsList.fromJson(response.data);
    }).catchError((err) {
      print('dio error: $err');
      Toast.show('请求发生了错误');
    });
  }

  static Future<NewsDetail> getContent(String uniquekey) async {
    Dio dio = new Dio();

    Map<String, dynamic> query = {
      'uniquekey': uniquekey,
    };

    return dio
        .get('$_baseUrl/content', queryParameters: query)
        .then((response) {
      return NewsDetail.fromJson(response.data);
    }).catchError((err) {
      print('dio error: $err');
      Toast.show('请求发生了错误');
    });
  }
}
