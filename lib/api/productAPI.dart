
import 'package:dio/dio.dart';
import 'package:hamroshop/response/productResponse.dart';
import 'package:hamroshop/util/urls.dart';


class ProductAPI {
  Future<ProductResponse?> getproduct(String? search) async {
    Future.delayed(const Duration(seconds: 2), () {});
    ProductResponse? productResponse;
    Response response;

    try {
      var dio = Dio();
      var url = baseUrl + getProductsUrl;
      response = await dio.get(url, queryParameters: {'keyword': search}
      );

      if (response.statusCode == 200) {
        productResponse = ProductResponse.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
    }
    return productResponse;
  }
}
