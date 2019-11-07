import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class AlbumModel {
  final int id;
  final int size;
  final int mark;

  final bool paid;
  final bool onSale;

  final String name;
  final String picUrl;
  final String company;
  final String blurPicUrl;
  final String tags;
  final String subType;
  final String description;
  final String briefDesc;

  final List<AlbumModel> artists;

  AlbumModel({
    this.artists,
    this.blurPicUrl,
    this.briefDesc,
    this.company,
    this.description,
    this.id,
    this.mark,
    this.name,
    this.onSale,
    this.paid,
    this.picUrl,
    this.size,
    this.subType,
    this.tags
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}