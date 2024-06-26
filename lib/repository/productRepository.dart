import 'package:hamroshop/api/productAPI.dart';
import 'package:hamroshop/response/productResponse.dart';

class ProductRepository {
  Future<ProductResponse?> getProducts(String? search) async {
    return ProductAPI().getProducts(search);
  }
}
