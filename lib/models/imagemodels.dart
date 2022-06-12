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
  List<FileSystemEntity> _files = Directory('images').listSync();
  List<FileSystemEntity> get files => _files;

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
    _files = Directory(_currentPath).listSync();
    notifyListeners();
  }

  void resetCurrentPath() {
    print('Reset Currentpath');
    _currentPath = 'images';
    _files = Directory(_currentPath).listSync();
    notifyListeners();
  }
}

class SelectedImageModel with ChangeNotifier {
  List<String> _selectedImagePathList = [];
  List<String> get selectedImagePathList => _selectedImagePathList;

  void resetList() {
    print('List reset.');
    _selectedImagePathList = [];
    notifyListeners();
  }

  void add(String path) {
    print(path + ' is selected. ');
    _selectedImagePathList.add(path);
    print(_selectedImagePathList);
    notifyListeners();
  }

  void remove(String path) {
    print(path + ' is removed. ');
    _selectedImagePathList.remove(path);
    print(_selectedImagePathList);
    notifyListeners();
  }

  bool isSelected(String path) {
    return _selectedImagePathList.contains(path);
  }
}
