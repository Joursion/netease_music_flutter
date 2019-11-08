/**
 * 全局 Provider
 * 比如主题，当前的路由等，可在此扩展
 */
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  int currentTabIndex = 0;

  changeTabIndex(int newIndex) {
    currentTabIndex = newIndex;
    notifyListeners();
  }
}