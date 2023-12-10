import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User.getNewEmpty();
  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
