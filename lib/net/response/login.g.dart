// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    code: json['code'] as int,
    loginType: json['loginType'] as int,
    profile: json['profile'] == null
        ? null
        : UserModel.fromJson(json['profile'] as Map<String, dynamic>),
    msg: json['msg'] as String,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'loginType': instance.loginType,
      'profile': instance.profile,
      'msg': instance.msg,
    };
