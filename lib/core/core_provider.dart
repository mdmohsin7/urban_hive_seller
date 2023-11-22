import 'package:flutter/material.dart';

class CoreProvider extends ChangeNotifier {
  int homeIndex = 0;

  void updateHomeIndex(int index) {
    homeIndex = index;
    notifyListeners();
  }
}
