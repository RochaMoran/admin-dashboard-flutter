
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // TODO: request http
    _token  = 'fdsahfsdajfsdalkfjsalkfjsdalkfsdjlkfds';
    LocalStorage.prefs.setString('token', _token!);
   
    authStatus = AuthStatus.authenticated;
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
    notifyListeners();
  }

  Future<bool>isAuthenticated() async {
    final token = (LocalStorage.prefs.getString('token'));
    
    if(token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return Future.value(false);
    }

    print('IStatus $authStatus');
    //TODO: request http

    await Future.delayed(const Duration(seconds: 1));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return Future.value(true);
  }
}