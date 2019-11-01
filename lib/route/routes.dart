import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_netease_cloud_music/route/route_handler.dart';

class Routes {
  static String home = "/";
  static String login = "/login";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT EXISTS");
        return null;
      }
    );

    router.define(login, handler: loginHandler);
  }
}