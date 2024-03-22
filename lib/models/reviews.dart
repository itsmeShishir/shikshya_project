import 'package:json_annotation/json_annotation.dart';
part 'reviews.g.dart';

@JsonSerializable()
class Reviews {
  String? user;
  String? name;
  int? rating;
  String? comment;
  String? time;

  Reviews({this.user, this.name, this.rating, this.comment, this.time});
  factory Reviews.fromJson(Map<String, dynamic> json) => _$ReviewsFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}
