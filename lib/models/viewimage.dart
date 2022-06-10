import 'package:flutter/material.dart';

class ViewImage with ChangeNotifier {
  String _imagepath = '';

  String get imagepath => _imagepath;
  void changeImagepath(String newpath) {
    _imagepath = newpath;
    notifyListeners();
  }
}
