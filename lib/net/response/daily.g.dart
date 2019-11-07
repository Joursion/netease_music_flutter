// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyResponse _$DailyResponseFromJson(Map<String, dynamic> json) {
  return DailyResponse(
    code: json['code'] as int,
    recommend: (json['recommend'] as List)
        ?.map((e) =>
            e == null ? null : Recommend.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DailyResponseToJson(DailyResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'recommend': instance.recommend,
    };

Recommend _$RecommendFromJson(Map<String, dynamic> json) {
  return Recommend(
    name: json['name'] as String,
    artists: (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : ArtistModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$RecommendToJson(Recommend instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artists': instance.artists,
    };
