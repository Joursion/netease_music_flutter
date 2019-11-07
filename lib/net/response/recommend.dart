import 'package:flutter_netease_cloud_music/model/recommend.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recommend.g.dart';

@JsonSerializable()
class RecommendResponse {
  final int code;
  final List<RecommendModel> recommend;

  RecommendResponse({
    this.code,
    this.recommend
  });

  factory RecommendResponse.fromJson(Map<String, dynamic> json) => _$RecommendResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendResponseToJson(this);
}