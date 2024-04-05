import 'package:hamroshop/response/productResponse.dart';
import 'package:hamroshop/util/url.dart';
import 'package:dio/dio.dart';

class ProductAPI {
  Dio _dio = Dio();

  Future<ProductResponse?> getProducts(String? search) async {
    try {
      // Delay execution for 2 seconds (if needed for some reason)
      // await Future.delayed(const Duration(seconds: 2));

      var url = baseUrl + getProductsUrl;
      Response response = await _dio.get(url, queryParameters: {'keyword': search});

      if (response.statusCode == 200) {
        return ProductResponse.fromJson(response.data);
      } else {
        // Handle non-200 status codes
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle Dio errors
      print('Error while fetching products: $e');
      return null;
    }
  }
}
