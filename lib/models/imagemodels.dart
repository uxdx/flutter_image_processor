import 'dart:io';

import 'package:flutter/material.dart';

class LeftSideLargeImageModel with ChangeNotifier {
  String _imagepath = '';

  String get imagepath => _imagepath;
  void changeImagepath(String newpath) {
    _imagepath = newpath;
    notifyListeners();
  }
}

class ImageDirectoryModel with ChangeNotifier {
  String _currentPath = 'images';
  String get currentPath => _currentPath;
  List _files = Directory('images').listSync();
  List get files => _files;

  void fileRefresh() {
    print('Reset');
    _files = Directory(_currentPath)
        .listSync(); //use your folder name insted of resume.
    notifyListeners();
  }

  void changeCurrentPath(String newPath) {
    print('Change Currentpath');
    _currentPath = newPath;
    print(_currentPath);
    fileRefresh();
  }

  void resetCurrentPath() {
    print('Reset Currentpath');
    _currentPath = 'images';
    fileRefresh();
  }
}
