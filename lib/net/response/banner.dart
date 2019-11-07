import 'package:flutter_netease_cloud_music/model/banner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class BannerResponse {
  final List<BannerModel> banners;
  final int code;

  BannerResponse({
    this.banners,
    this.code
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) => _$BannerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}