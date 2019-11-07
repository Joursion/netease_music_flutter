// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankResponse _$RankResponseFromJson(Map<String, dynamic> json) {
  return RankResponse(
    code: json['code'] as int,
    list: (json['list'] as List)
        ?.map((e) =>
            e == null ? null : RankData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RankResponseToJson(RankResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'list': instance.list,
    };

RankData _$RankDataFromJson(Map<String, dynamic> json) {
  return RankData(
    tracks: (json['tracks'] as List)
        ?.map(
            (e) => e == null ? null : Track.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    updateFrequency: json['updateFrequency'] as String,
    coverImgUrl: json['coverImgUrl'] as String,
    description: json['description'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$RankDataToJson(RankData instance) => <String, dynamic>{
      'tracks': instance.tracks,
      'updateFrequency': instance.updateFrequency,
      'coverImgUrl': instance.coverImgUrl,
      'description': instance.description,
      'name': instance.name,
    };

Track _$TrackFromJson(Map<String, dynamic> json) {
  return Track(
    first: json['first'] as String,
    second: json['second'] as String,
  );
}

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'first': instance.first,
      'second': instance.second,
    };
