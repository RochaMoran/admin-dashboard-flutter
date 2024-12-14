import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    // validator: ,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: CustomInputs.authInputDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Correo',
                        icon: Icons.email),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    // validator: ,
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: CustomInputs.authInputDecoration(
                        hint: '**********',
                        label: 'Contraseña',
                        icon: Icons.lock),
                  ),
                  const SizedBox(height: 20),
                  CustomOutlinedButton(
                      onPressed: () {}, text: "Ingresar"),
                  const SizedBox(height: 20),
                  LinkText(
                      text: 'Nueva Cuenta',
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.registerRoute);
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
