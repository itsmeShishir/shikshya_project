
import 'package:dio/dio.dart';
import 'package:hamroshop/util/urls.dart';

class HttpServices {
  static final HttpServices _instance = HttpServices.internal();
  factory HttpServices() => _instance;
  HttpServices.internal();
  Dio? _dio;
  Dio getDioInstaDnce() {
    if (_dio == null) {
      return Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: const Duration(milliseconds: 5000)));
    } else {
      return _dio!;
    }
  }

  getDioInstance() {}
}
