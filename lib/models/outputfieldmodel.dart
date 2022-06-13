
import 'package:flutter/material.dart';

class OutputFieldModel with ChangeNotifier {
  List<String> _contents = [];

  List<String> get contents => _contents;

  void addMessage(String msg){
    _contents.add(msg);
    notifyListeners();
  }

  void addMessages(List<String> msgs){
    _contents.addAll(msgs);
    notifyListeners();
  }

  void reset(){
    _contents = [];
    notifyListeners();
  }
}