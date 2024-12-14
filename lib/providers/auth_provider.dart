
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    // TODO: request http
    _token  = 'fdsahfsdajfsdalkfjsalkfjsdalkfsdjlkfds';
    LocalStorage.prefs.setString('token', _token!);
    print("Save jwt: flsdkajfldksajfsdalkfjdsl");

    // TODO: redirect to dashboard
    notifyListeners();
  }
}