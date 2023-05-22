import 'package:dio/dio.dart';
import 'package:marvel_list/core/common/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: Constants.baseURL,
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }

  static Future<Response> getData(
      {required String path, Map<String, dynamic>? query}) async {
    final url = Constants.baseURL + path;
    query ??= {
      'apikey': Constants.publicApiKey,
      'ts': Constants.ts,
      'hash': Constants.hash,
    };
    print(url);
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    return await dio.post(path, data: data, queryParameters: query);
  }
}
