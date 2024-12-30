
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  User? user;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // TODO: request http
    final data = {
      'correo': email,
      'password': password
    };

    CafeApi.httpPost('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;
      LocalStorage.prefs.setString('token', authResponse.token);
      authStatus = AuthStatus.authenticated;
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackbarError('Usuario/Contraseña no válidos');
    });
   
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
          CafeApi.configureDio();
          notifyListeners();
        }).catchError((e) {
          NotificationsService.showSnackbarError('Hay un error en el registro. Posiblemente ya existe un usuario con ese correo.');
      });
  }

  Future<bool>isAuthenticated() async {
    final token = (LocalStorage.prefs.getString('token'));
    
    if(token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
     final response = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(response);
      user = authResponse.usuario;
      LocalStorage.prefs.setString('token', authResponse.token);
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      NotificationsService.showSnackbarError('Token no válido');
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}