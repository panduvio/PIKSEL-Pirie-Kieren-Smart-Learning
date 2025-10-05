import 'package:flutter/material.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';

class PageProvider extends ChangeNotifier {
  bool _isPretest = true;
  bool _isChoiceChosen = false;
  bool _isCodeCorrect = false;
  int _pageIndex = 21;
  int _userLevel = 1;
  int _kubusLevel = 1;
  int _balokLevel = 1;
  String _currentAnswer = '';
  UserEntity _user = UserEntity(username: '');

  bool get isPretest => _isPretest;
  bool get isChoiceChosen => _isChoiceChosen;
  bool get isCodeCorrect => _isCodeCorrect;
  int get pageIndex => _pageIndex;
  int get userLevel => _userLevel;
  int get kubusLevel => _kubusLevel;
  int get balokLevel => _balokLevel;
  String get currentAnswer => _currentAnswer;
  UserEntity get user => _user;

  void setChoice(bool status) {
    _isChoiceChosen = status;
    notifyListeners();
  }

  void setCodeCorrect(bool status) {
    _isCodeCorrect = status;
    notifyListeners();
  }

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void setTest(bool isPretest) {
    _isPretest = isPretest;
    notifyListeners();
  }

  void setAnswer(String answer) {
    _currentAnswer = answer;
    notifyListeners();
  }

  void setUserLevel(int level) {
    _userLevel = level;
    notifyListeners();
  }

  void setUserId(String id) {
    _user.id = id;
    notifyListeners();
  }

  void setKubusLevel(int level) {
    _kubusLevel = level;
    notifyListeners();
  }

  void setBalokLevel(int level) {
    _balokLevel = level;
    notifyListeners();
  }

  void setUser(UserEntity user) {
    _user = user;
    notifyListeners();
  }
}
