// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendModel _$RecommendModelFromJson(Map<String, dynamic> json) {
  return RecommendModel(
    alg: json['alg'] as String,
    copywriter: json['copywriter'] as String,
    id: json['id'] as int,
    name: json['name'] as String,
    picUrl: json['picUrl'] as String,
    playcount: json['playcount'] as int,
    trackCount: json['trackCount'] as int,
    type: json['type'] as int,
    userId: json['userId'] as int,
  );
}

Map<String, dynamic> _$RecommendModelToJson(RecommendModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'playcount': instance.playcount,
      'trackCount': instance.trackCount,
      'userId': instance.userId,
      'alg': instance.alg,
      'copywriter': instance.copywriter,
    };
