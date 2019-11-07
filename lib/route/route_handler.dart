import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/daily/daily_page.dart';
import 'package:flutter_netease_cloud_music/pages/home/home_page.dart';
import 'package:flutter_netease_cloud_music/pages/login/login_page.dart';
import 'package:flutter_netease_cloud_music/pages/play_list/play_list.dart';
import 'package:flutter_netease_cloud_music/pages/rank/rank_page.dart';

var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return LoginPage();
  }
);

var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return HomePage();
  }
);

var dailyHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> pamras) {
    return DailyPage();
  }
);

var rankListHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return RankPage();
  }
);

var playListHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return PlayListPage();
  }
);


