import 'package:flutter/material.dart';

class TestingViewModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void addCount() {
    _count++;
    notifyListeners();
  }
}
