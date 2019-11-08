import 'package:flutter_netease_cloud_music/model/comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class CommentResponse {
  final int code;
  final int total;
  final List<CommentModel> comments;
  final List<CommentModel> hotComments;

  CommentResponse({
    this.code,
    this.comments,
    this.hotComments,
    this.total
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) => _$CommentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CommentResponseToJson(this);
}