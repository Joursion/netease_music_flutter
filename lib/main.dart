import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/application.dart';
import 'package:flutter_netease_cloud_music/pages/login/login_page.dart';
import 'package:flutter_netease_cloud_music/provider/player.dart';
import 'package:flutter_netease_cloud_music/provider/setting.dart';
import 'package:flutter_netease_cloud_music/provider/user.dart';
import 'package:flutter_netease_cloud_music/route/routes.dart';
import 'package:provider/provider.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserProvider>.value(
        value: UserProvider(),
      ),
      ChangeNotifierProvider<PlayerProvider>.value(
        value: PlayerProvider(),
      ),
      ChangeNotifierProvider<SettingProvider>.value(
        value: SettingProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(),
      theme: ThemeData(
        splashColor: Colors.transparent,
      ),
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
    );
  }
}
