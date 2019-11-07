// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    avatarUrl: json['avatarUrl'] as String,
    backgroundUrl: json['backgroundUrl'] as String,
    followeds: json['followeds'] as int,
    follows: json['follows'] as int,
    nickname: json['nickname'] as String,
    playlistCount: json['playlistCount'] as int,
    userId: json['userId'] as int,
    vipType: json['vipType'] as int,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'nickname': instance.nickname,
      'backgroundUrl': instance.backgroundUrl,
      'playlistCount': instance.playlistCount,
      'followeds': instance.followeds,
      'follows': instance.follows,
      'userId': instance.userId,
      'vipType': instance.vipType,
    };
