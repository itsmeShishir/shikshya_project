
import 'package:hamroshop/api/orderAPI.dart';
import 'package:hamroshop/response/orderResponse.dart';

class OrderRepository {
  Future<OrderResponse?> getOrder() async {
    return await OrderAPI().getOrderHistory();
  }
}
