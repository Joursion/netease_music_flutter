import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/application.dart';
import 'package:flutter_netease_cloud_music/model/user.dart';

class UserProvider with ChangeNotifier {
  UserModel _user;

  void init() {
    if (Application.sp.containsKey('user')) {
      String s = Application.sp.getString("user");
      _user = UserModel.fromJson(json.decode(s));
    }
    // _user = 
  }
}