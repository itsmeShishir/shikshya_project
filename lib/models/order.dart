import 'package:hamroshop/models/orderItems.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: "_id")
  String? id;
  List<OrderItems>? orderItems;
  int? totalPrice;
  String? orderStatus;
  Order({this.id, this.orderItems, this.totalPrice, this.orderStatus});
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
