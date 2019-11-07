// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendResponse _$RecommendResponseFromJson(Map<String, dynamic> json) {
  return RecommendResponse(
    code: json['code'] as int,
    recommend: (json['recommend'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RecommendResponseToJson(RecommendResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'recommend': instance.recommend,
    };
