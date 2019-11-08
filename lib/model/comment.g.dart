// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel(
    beReplied: (json['beReplied'] as List)
        ?.map((e) =>
            e == null ? null : Replied.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    commentId: json['commentId'] as int,
    content: json['content'] as String,
    liked: json['liked'] as bool,
    likedCount: json['likedCount'] as int,
    time: json['time'] as int,
  );
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'content': instance.content,
      'liked': instance.liked,
      'likedCount': instance.likedCount,
      'time': instance.time,
      'beReplied': instance.beReplied,
    };

Replied _$RepliedFromJson(Map<String, dynamic> json) {
  return Replied(
    content: json['content'] as String,
    user: json['user'] == null
        ? null
        : RepliedUser.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RepliedToJson(Replied instance) => <String, dynamic>{
      'content': instance.content,
      'user': instance.user,
    };

RepliedUser _$RepliedUserFromJson(Map<String, dynamic> json) {
  return RepliedUser(
    nickname: json['nickname'] as String,
    userId: json['userId'] as int,
    avatarUrl: json['avatarUrl'] as String,
    authStatus: json['authStatus'] as int,
  );
}

Map<String, dynamic> _$RepliedUserToJson(RepliedUser instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'userId': instance.userId,
      'avatarUrl': instance.avatarUrl,
      'authStatus': instance.authStatus,
    };
