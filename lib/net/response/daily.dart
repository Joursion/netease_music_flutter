import 'package:flutter_netease_cloud_music/model/artist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily.g.dart';

@JsonSerializable()
class DailyResponse {
  final int code;
  final List<Recommend> recommend;

  DailyResponse({
    this.code,
    this.recommend
  });

  factory DailyResponse.fromJson(Map<String, dynamic> json) => _$DailyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DailyResponseToJson(this);


}

@JsonSerializable()
class Recommend {
  final int id;
  final String name;
  final List<ArtistModel> artists;

  Recommend({
    this.name,
    this.artists,
    this.id
  });

  factory Recommend.fromJson(Map<String, dynamic> json) => _$RecommendFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendToJson(this);
}