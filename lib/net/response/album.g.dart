// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumListResponse _$AlbumListResponseFromJson(Map<String, dynamic> json) {
  return AlbumListResponse(
    code: json['code'] as int,
    albums: (json['albums'] as List)
        ?.map((e) =>
            e == null ? null : AlbumModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$AlbumListResponseToJson(AlbumListResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'albums': instance.albums,
      'total': instance.total,
    };
