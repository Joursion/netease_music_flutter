import 'package:json_annotation/json_annotation.dart';

part 'rank.g.dart';

@JsonSerializable()
class RankResponse {
  final int code;
  final List<RankData> list;

  RankResponse({
    this.code,
    this.list
  });

  factory RankResponse.fromJson(Map<String, dynamic> json) => _$RankResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RankResponseToJson(this);
}

@JsonSerializable()
class RankData {
  final List<Track> tracks;
  final String updateFrequency;
  final String coverImgUrl;
  final String description;
  final String name;

  RankData({
    this.tracks,
    this.updateFrequency,
    this.coverImgUrl,
    this.description,
    this.name
  });

  factory RankData.fromJson(Map<String, dynamic> json) => _$RankDataFromJson(json);
  Map<String, dynamic> toJson() => _$RankDataToJson(this);
}

@JsonSerializable()
class Track {
  final String first;
  final String second;

  Track({
    this.first,
    this.second
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}