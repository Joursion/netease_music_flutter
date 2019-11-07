import 'package:json_annotation/json_annotation.dart';

part 'artist.g.dart';

@JsonSerializable()
class ArtistModel {
  
  final int id;
  final int img1v1Id;
  final int topicPerson;
  final int picId;
  final int albumSize;
  final int musicSize;
  final String briefDesc;
  final bool followed;
  final String img1v1Url;
  final String trans;
  final String picUrl;
  final String name;
  final String img1v1IdStr;

  ArtistModel({
    this.albumSize,
    this.briefDesc,
    this.followed,
    this.id,
    this.img1v1Id,
    this.img1v1IdStr,
    this.img1v1Url,
    this.musicSize,
    this.name,
    this.picId,
    this.picUrl,
    this.topicPerson,
    this.trans
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) => _$ArtistModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);
}