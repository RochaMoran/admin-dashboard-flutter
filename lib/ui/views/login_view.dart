import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider = Provider.of<LoginFormProvider>(context);

        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: loginFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (_) => onFormSubmit(loginFormProvider, authProvider),
                      validator: (value) {
                        if(EmailValidator.validate(value!)) return null;
                        
                        return 'Ingrese un correo valido';
                      },
                      onChanged: (value) => loginFormProvider.email = value,
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
                      onFieldSubmitted: (_) => onFormSubmit(loginFormProvider, authProvider),
                      onChanged: (value) => loginFormProvider.password = value,
                      validator: (value){
                        if(value == null || value.isEmpty) return 'Ingrese su contraseña';
                        if(value.length < 6) return 'La contraseña debe contener almenos 6 caracteres';
                        return null;
                      },
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
                        onPressed: () => onFormSubmit(loginFormProvider, authProvider), text: "Ingresar"),
                    const SizedBox(height: 20),
                    LinkText(
                        text: 'Nueva Cuenta',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Flurorouter.registerRoute);
                        })
                  ],
                ),
              ),
            ),
          ));
      })
    );
  }

  void onFormSubmit(LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();

    if(isValid) {
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
  }
}
