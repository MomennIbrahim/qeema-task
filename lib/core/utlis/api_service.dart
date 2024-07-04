import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final _baseUrl = 'https://student.valuxapps.com/api/';
  final Dio _dio;

  ApiService(this._dio) {
    _dio.interceptors.add(PrettyDioLogger());
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));

    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 180),
      sendTimeout: const Duration(seconds: 180),
      responseType: ResponseType.json,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "lang": "en",
      },
    );
  }

  Future<Map<String, dynamic>> getData(
      {required String endPoint, Map<String, dynamic>? query}) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: query,
    );
    return response.data;
  }
}
