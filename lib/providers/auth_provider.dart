
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
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
  Usuario? user;

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

   register(String email, String password, String name) {
      final data = {
        'nombre': name,
        'correo': email,
        'password': password
      };

      CafeApi.httpPost('/usuarios', data)
        .then((json) {
          final authResponse = AuthResponse.fromMap(json);
          user = authResponse.usuario;

          authStatus = AuthStatus.authenticated;
          LocalStorage.prefs.setString('token', authResponse.token);
          NavigationService.replaceTo(Flurorouter.dashboardRoute);
          notifyListeners();
        }).catchError((e) {
          print('Error en $e');
          //TODO: mostrar notificacion de error
      });
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