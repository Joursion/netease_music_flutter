// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistModel _$ArtistModelFromJson(Map<String, dynamic> json) {
  return ArtistModel(
    albumSize: json['albumSize'] as int,
    briefDesc: json['briefDesc'] as String,
    followed: json['followed'] as bool,
    id: json['id'] as int,
    img1v1Id: json['img1v1Id'] as int,
    img1v1IdStr: json['img1v1IdStr'] as String,
    img1v1Url: json['img1v1Url'] as String,
    musicSize: json['musicSize'] as int,
    name: json['name'] as String,
    picId: json['picId'] as int,
    picUrl: json['picUrl'] as String,
    topicPerson: json['topicPerson'] as int,
    trans: json['trans'] as String,
  );
}

Map<String, dynamic> _$ArtistModelToJson(ArtistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img1v1Id': instance.img1v1Id,
      'topicPerson': instance.topicPerson,
      'picId': instance.picId,
      'albumSize': instance.albumSize,
      'musicSize': instance.musicSize,
      'briefDesc': instance.briefDesc,
      'followed': instance.followed,
      'img1v1Url': instance.img1v1Url,
      'trans': instance.trans,
      'picUrl': instance.picUrl,
      'name': instance.name,
      'img1v1IdStr': instance.img1v1IdStr,
    };
