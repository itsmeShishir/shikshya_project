
import 'package:hamroshop/util/url.dart';
import 'package:dio/dio.dart';

class HttpServices {
  static final HttpServices _instance = HttpServices.internal();
  factory HttpServices() => _instance;
  HttpServices.internal();
  Dio? _dio;
  Dio getDioInstance() {
    if (_dio == null) {
      return Dio(BaseOptions(baseUrl: baseUrl));
    } else {
      return _dio!;
    }
  }
}
