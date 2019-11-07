import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  final String avatarUrl;
  final String nickname;
  final String backgroundUrl;
  final int playlistCount;
  final int followeds;
  final int follows;
  final int userId;
  final int vipType; 

  UserModel({
    this.avatarUrl,
    this.backgroundUrl,
    this.followeds,
    this.follows,
    this.nickname,
    this.playlistCount,
    this.userId,
    this.vipType
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}