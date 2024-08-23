import 'package:dio/dio.dart';
import 'package:news_app_route1/core/networking/api_const.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String url}) async {
    Response response=await dio!.get(url);
    return response;
  }

}

