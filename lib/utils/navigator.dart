
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/application.dart';
import 'package:flutter_netease_cloud_music/route/routes.dart';

class NavigatorUtil {
  static navigateTo(
    BuildContext context,String path, {
    bool replace = false,
    bool clearStack = false,
    Duration transitionDuration = const Duration(milliseconds: 250),
    RouteTransitionsBuilder transitionsBuilder
  }) {
    Application.router.navigateTo(
      context, path,
      replace: replace,
      clearStack: clearStack,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionsBuilder,
      transition: TransitionType.material
    );
  }

  // 登录页
  static void gotoLogin(BuildContext context) {
    navigateTo(context, Routes.login, clearStack: true);
  }

  // 首页
  static void gotoHomePage(BuildContext context) {
    navigateTo(context, Routes.home, clearStack: true);
  }

  // 每日推荐
  static void gotoDailyPage(BuildContext context) {
    navigateTo(context, Routes.daily);
  }

  // 我的音乐
  static void gotoMyMusicPage(BuildContext context) {
    navigateTo(context, Routes.myMusic);
  }

  // 我的
  static void gotoMinePage(BuildContext context) {
    navigateTo(context, Routes.mine);
  }

  // 播放页
  static void gotoPlayPage (BuildContext context) {
    navigateTo(context, Routes.playSong);
  }

  // 歌单页
  static void gotoPlayListPage (BuildContext context) {
    navigateTo(context, Routes.playList);
  }

  static void gotoRankListPage (BuildContext context) {
    navigateTo(context, Routes.rankList);
  }
}