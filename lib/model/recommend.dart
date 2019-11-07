import 'package:json_annotation/json_annotation.dart';

part 'recommend.g.dart';

@JsonSerializable()
class RecommendModel {
  final int id;
  final int type;
  final String name;
  final String picUrl;
  final int playcount;
  final int trackCount;
  final int userId;
  final String alg;
  // final String creator;
  final String copywriter;

  RecommendModel({
    this.alg,
    this.copywriter,
    // this.creator,
    this.id,
    this.name,
    this.picUrl,
    this.playcount,
    this.trackCount,
    this.type,
    this.userId
  });

  factory RecommendModel.fromJson(Map<String, dynamic> json) => _$RecommendModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendModelToJson(this);
}