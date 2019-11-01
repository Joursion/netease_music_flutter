
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/application.dart';
import 'package:flutter_netease_cloud_music/route/routes.dart';

class Navigator {
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

  static void gotoLogin(BuildContext context) {
    navigateTo(context, Routes.login, clearStack: true);
  }

  static void gotoHomePage(BuildContext context) {

  }
}