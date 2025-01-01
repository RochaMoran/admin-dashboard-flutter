import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  User? user;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void updateListeners() {
    notifyListeners();
  }

  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = User(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado,
      google: google ?? user!.google,
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo,
      uid: uid ?? user!.uid,
      img: img ?? user!.img,
    );
    notifyListeners();
  }

  bool validForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future updateUser() async {
    if (!validForm()) return false;
    
    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo
    };
    try {
      final resp = await CafeApi.httpPut('/usuarios/${user!.uid}', data);
      print(resp);
      return true;

    } catch (e) {
      print(e);
      return false;
    }
  }
}
