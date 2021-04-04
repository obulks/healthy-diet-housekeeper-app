import 'package:healthy_diet_housekeeper/public.dart';

class FoodApi {
  static String _baseUrl = '${Api.baseUrl}/foods';

  static Future<FoodList> getFoodList(String word, int page) {
    Dio dio = new Dio();

    Map<String, dynamic> query = {
      'word': word,
      'page': page,
    };

    return dio.get('$_baseUrl/list', queryParameters: query).then((response) {
      return FoodList.fromJson(response.data);
    }).catchError((err) {
      print('dio error: $err');
      Toast.show('请求发生了错误');
    });
  }

  static Future<FoodList> searchFood(String word) {
    Dio dio = new Dio();

    Map<String, dynamic> query = {
      'word': word,
    };

    return dio.get('$_baseUrl', queryParameters: query).then((response) {
      return FoodList.fromJson(response.data);
    }).catchError((err) {
      print('dio error: $err');
      Toast.show('请求发生了错误');
    });
  }
}
