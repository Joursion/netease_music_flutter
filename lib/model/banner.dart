import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable(nullable: true)
class BannerModel {
  final String pic;
  final String typeTitle;
  final int targetId;
  final String imageUrl;

  BannerModel({this.pic, this.targetId, this.typeTitle, this.imageUrl});

  factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
