// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reviews _$ReviewsFromJson(Map<String, dynamic> json) => Reviews(
      user: json['user'] as String?,
      name: json['name'] as String?,
      rating: json['rating'] as int?,
      comment: json['comment'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'user': instance.user,
      'name': instance.name,
      'rating': instance.rating,
      'comment': instance.comment,
      'time': instance.time,
    };
