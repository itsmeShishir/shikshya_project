// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      success: json['success'] as bool?,
      profile: (json['profile'] as List<dynamic>?)
          ?.map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'profile': instance.profile,
    };
