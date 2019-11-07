// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) {
  return BannerResponse(
    banners: (json['banners'] as List)
        ?.map((e) =>
            e == null ? null : BannerModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    code: json['code'] as int,
  );
}

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'code': instance.code,
    };
