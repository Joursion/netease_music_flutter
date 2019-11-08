import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_netease_cloud_music/route/route_handler.dart';

class Routes {
  static String home = "/";
  static String login = "/login";
  static String daily = '/daily';
  static String playList = '/playList';
  static String rankList = '/rankList';
  static String playSong = '/playSong';
  static String comment = '/comment';
  static String myMusic = '/myMusic';
  static String mine = '/mine';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT EXISTS");
        return null;
      }
    );

    router.define(login, handler: loginHandler);
    router.define(home, handler: homeHandler);
    router.define(daily, handler: dailyHandler);
    router.define(rankList, handler: rankListHandler);
    router.define(playList, handler: playListHandler);
    router.define(mine, handler: mineHandler);
  }
}