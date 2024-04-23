import 'package:flutter/material.dart';
import 'package:rostros_encontrados/presentation/screens/user.dart'; // Importa el modelo User

class SessionProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}