// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LyricResponse _$LyricResponseFromJson(Map<String, dynamic> json) {
  return LyricResponse(
    code: json['code'] as int,
    lrc: json['lrc'] == null
        ? null
        : Lyric.fromJson(json['lrc'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LyricResponseToJson(LyricResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'lrc': instance.lrc,
    };

Lyric _$LyricFromJson(Map<String, dynamic> json) {
  return Lyric(
    lyric: json['lyric'] as String,
    version: json['version'] as int,
  );
}

Map<String, dynamic> _$LyricToJson(Lyric instance) => <String, dynamic>{
      'lyric': instance.lyric,
      'version': instance.version,
    };
