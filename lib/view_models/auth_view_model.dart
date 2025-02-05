import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lxp_flutter_dart/repositories/auth_repo.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({required AuthRepo authRepo}) : _authRepo = authRepo;

  final AuthRepo _authRepo;
  String _password = '';
  String _email = '';
  String _status = '';
  String get status => _status;
  bool loggedIn = false;
  User? user;

  void updateLoginState() {
    loggedIn = _authRepo.checkIsLoggedIn();
    user = _authRepo.getCurrentUser();
  }

  void emailOnChange(String newValue) {
    _email = newValue;
  }

  void passwordOnChange(String newValue) {
    _password = newValue;
  }

  void login() async {
    _status = await _authRepo.login(_email, _password);
    updateLoginState();
    notifyListeners();
  }

  void logout() {
    _authRepo.logout();
    _status = 'logged out';
    loggedIn = false;
    notifyListeners();
  }
}
