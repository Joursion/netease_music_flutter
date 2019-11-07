// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) {
  return AlbumModel(
    artists: (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : AlbumModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    blurPicUrl: json['blurPicUrl'] as String,
    briefDesc: json['briefDesc'] as String,
    company: json['company'] as String,
    description: json['description'] as String,
    id: json['id'] as int,
    mark: json['mark'] as int,
    name: json['name'] as String,
    onSale: json['onSale'] as bool,
    paid: json['paid'] as bool,
    picUrl: json['picUrl'] as String,
    size: json['size'] as int,
    subType: json['subType'] as String,
    tags: json['tags'] as String,
  );
}

Map<String, dynamic> _$AlbumModelToJson(AlbumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'mark': instance.mark,
      'paid': instance.paid,
      'onSale': instance.onSale,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'company': instance.company,
      'blurPicUrl': instance.blurPicUrl,
      'tags': instance.tags,
      'subType': instance.subType,
      'description': instance.description,
      'briefDesc': instance.briefDesc,
      'artists': instance.artists,
    };
