import 'package:flutter_netease_cloud_music/model/album.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class AlbumListResponse {
  final int code;
  final List<AlbumModel> albums;
  final int total;

  AlbumListResponse({
    this.code,
    this.albums,
    this.total
  });

  factory AlbumListResponse.fromJson(Map<String, dynamic> json) => _$AlbumListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumListResponseToJson(this);
}