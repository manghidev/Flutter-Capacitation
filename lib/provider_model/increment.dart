import 'package:flutter/material.dart';

class Increment extends ChangeNotifier {
  int _myCont = 0;

  set setCont(int value) {
    _myCont += value;
    notifyListeners();
  }

  int get getCont => _myCont;
}
