import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  int currentTabIndex = 0;

  changeTabIndex(int newIndex) {
    currentTabIndex = newIndex;
    notifyListeners();
  }
}