
import 'package:flutter_netease_cloud_music/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class LoginResponse {
  final int code;
  final int loginType;
  final UserModel profile;
  final String msg;

  LoginResponse({
    this.code,
    this.loginType,
    this.profile,
    this.msg,
  });
  
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}