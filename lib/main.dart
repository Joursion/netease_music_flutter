import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/application.dart';
import 'package:flutter_netease_cloud_music/net/api.dart';
import 'package:flutter_netease_cloud_music/pages/home/home_page.dart';
import 'package:flutter_netease_cloud_music/pages/index.dart';
import 'package:flutter_netease_cloud_music/pages/login/login_page.dart';
import 'package:flutter_netease_cloud_music/provider/app.dart';
import 'package:flutter_netease_cloud_music/provider/player.dart';
import 'package:flutter_netease_cloud_music/provider/setting.dart';
import 'package:flutter_netease_cloud_music/provider/user.dart';
import 'package:flutter_netease_cloud_music/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  Application.initSp();

  API.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserProvider>.value(
        value: UserProvider(),
      ),
      ChangeNotifierProvider<PlayerProvider>.value(
        value: PlayerProvider(),
      ),
      ChangeNotifierProvider<AppProvider>.value(
        value: AppProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IndexPage(),
      theme: ThemeData(
        splashColor: Colors.transparent,
      ),
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
    );
  }
}
