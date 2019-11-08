import 'package:json_annotation/json_annotation.dart';

part 'lyric.g.dart';

@JsonSerializable()
class LyricResponse {
  final int code;
  final Lyric lrc;

  LyricResponse({
    this.code,
    this.lrc
  });

  factory LyricResponse.fromJson(Map<String, dynamic> json) => _$LyricResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LyricResponseToJson(this);
}


@JsonSerializable()
class Lyric {
  final String lyric;
  final int version;

  Lyric({
    this.lyric,
    this.version
  });

  factory Lyric.fromJson(Map<String, dynamic> json) => _$LyricFromJson(json);
  Map<String, dynamic> toJson() => _$LyricToJson(this);
}

