import "../models/order.dart";
import "package:json_annotation/json_annotation.dart";
part "orderResponse.g.dart";
@JsonSerializable()
class OrderResponse{
  bool? success;
  List<Order>? order;
  OrderResponse({this.success, this.order});
  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson()=> _$OrderResponseToJson(this);
}