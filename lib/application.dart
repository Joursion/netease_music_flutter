import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application {
  static Router router;
  static SharedPreferences sp;
  static double screenWidth;
  static double screenHeight;
  static double statusBarHeight;

  // 初始化 sp
  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }

  // static set
}