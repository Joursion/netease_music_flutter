// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) {
  return BannerModel(
    pic: json['pic'] as String,
    targetId: json['targetId'] as int,
    typeTitle: json['typeTitle'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'pic': instance.pic,
      'typeTitle': instance.typeTitle,
      'targetId': instance.targetId,
      'imageUrl': instance.imageUrl,
    };
