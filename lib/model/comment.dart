/**
 * 评论
 */
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class CommentModel {
  final int commentId;
  final String content;
  final bool liked;
  final int likedCount;
  final int time;
  final List<Replied> beReplied;

  CommentModel({
    this.beReplied,
    this.commentId,
    this.content,
    this.liked,
    this.likedCount,
    this.time
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}

// 被回复的
@JsonSerializable()
class Replied {
  final String content;
  final RepliedUser user;

  Replied({this.content, this.user});

  factory Replied.fromJson(Map<String, dynamic> json) => _$RepliedFromJson(json);
  Map<String, dynamic> toJson() => _$RepliedToJson(this);
}


// 被回复的用户
@JsonSerializable()
class RepliedUser {
  final String nickname;
  final int userId;
  final String avatarUrl;
  final int authStatus;

  RepliedUser({
    this.nickname,
    this.userId,
    this.avatarUrl,
    this.authStatus
  });

  factory RepliedUser.fromJson(Map<String, dynamic> json) => _$RepliedUserFromJson(json);
  Map<String, dynamic> toJson() => _$RepliedUserToJson(this);
}