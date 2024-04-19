// viewmodels/current_index_view_model.dart

import 'package:flutter/material.dart';

class CurrentIndexViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
