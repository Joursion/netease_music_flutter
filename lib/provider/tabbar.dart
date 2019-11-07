import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  int currentIndex = 0;

  changeIndex(int nextIndex) {
    currentIndex = nextIndex;
    notifyListeners();
  }
}