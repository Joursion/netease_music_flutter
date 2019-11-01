import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/login/login_page.dart';

var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return LoginPage();
  }
);
