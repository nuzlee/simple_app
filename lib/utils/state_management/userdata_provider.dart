import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  String _userId = '';

  String get userId => _userId;

  void setUserId(String paramUserId) {
    _userId = paramUserId;
    notifyListeners();
  }
}