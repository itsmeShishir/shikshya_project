
import 'package:hamroshop/api/productAPI.dart';
import 'package:hamroshop/response/productResponse.dart';

class ProductRepository {
  Future<ProductResponse?> getproduct(String? search) async {
    return await ProductAPI().getproduct(search);
  }
}
