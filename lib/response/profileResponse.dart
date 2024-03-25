import "../models/profiles.dart";
import "package:json_annotation/json_annotation.dart";
part "profileResponse.g.dart";

@JsonSerializable()
class ProfileResponse{
  bool? success;
  List<Profile>? profile;
  ProfileResponse({this.success, this.profile});
  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);
  Map<String, dynamic> toJson()=> _$ProfileResponseToJson(this);
}