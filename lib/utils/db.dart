import 'dart:convert';

import 'package:flutter_netease_cloud_music/application.dart';
import 'package:flutter_netease_cloud_music/model/user.dart';

class DBUtil {
  static saveUser(UserModel user) {
    Application.sp.setString('user', json.encode(user.toJson()));
  }

  static UserModel getUser() {
    var user = Application.sp.get('user');
    return user;
  }
}