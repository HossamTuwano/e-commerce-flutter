import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  User user = User(email: '', password: '');
  login({required String email, required String password}) {
    user = User(email: email, password: password);
    notifyListeners();
  }
}

class User {
  // final String name;
  final String email;
  final String password;

  User({required this.email, required this.password});
}
