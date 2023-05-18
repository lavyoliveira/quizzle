import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String _name = "";
  int _score = 0;

  String get name => _name;

  void setName(String name) {
    _name = name;
  }

  int get score => _score;

  void setScore(int score) {
    _score = score;
  }
}
