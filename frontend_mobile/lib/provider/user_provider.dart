import 'package:flutter/material.dart';
import 'package:frontend_mobile/model/cv/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      userId: 0,
      username: '',
      email: '',
      firstName: '',
      lastName: '',
      phone: '',
      location: '',
      school: '',
      headline: '');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
