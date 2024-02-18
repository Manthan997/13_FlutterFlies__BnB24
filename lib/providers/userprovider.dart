import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String username = "Raju";
  String role = "Doctor";
  //int get currentIndex => _currentIndex;
  String get uname => username;
  void setUname(String name, String rol) {
    username = name;  
    role = rol;
    notifyListeners();
  }
}
