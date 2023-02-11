import 'package:flutter/material.dart';
import 'Package:penge_send/models/user.dart';
import 'package:penge_send/auth/auth_method.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User get getUser => _user!;
  final AuthMethod _authMethod = AuthMethod();
  Future<void> refreshUser() async {
    User myUser = await _authMethod.getUserDetails();
    _user = myUser;
    notifyListeners();
  }
}
