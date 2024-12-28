import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider = Provider.of<RegisterFormProvider>(context);

        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: registerFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value == null || value.isEmpty) return 'Ingrese su nombre';
                        if(value.length < 3) return 'El nombre debe contener almenos 3 caracteres';
                        return null;
                      },
                      onChanged: (value) => registerFormProvider.name = value,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: CustomInputs.authInputDecoration(
                          hint: 'Ingrese su nombre',
                          label: 'Nombre',
                          icon: Icons.person),
                    ),
                        const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => registerFormProvider.email = value,
                      validator: (value) {
                        if(EmailValidator.validate(value!)) return null;
                        
                        return 'Ingrese un correo valido';
                      },
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
                       validator: (value){
                        if(value == null || value.isEmpty) return 'Ingrese su contraseña';
                        if(value.length < 6) return 'La contraseña debe contener almenos 6 caracteres';
                        return null;
                      },
                      onChanged: (value) => registerFormProvider.password = value,
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
                        onPressed: () {
                          final validForm = registerFormProvider.validateForm();
                          if(!validForm) return;

                          final authProvider = Provider.of<AuthProvider>(context, listen: false);
                          authProvider.register(
                            registerFormProvider.email,
                            registerFormProvider.password,
                            registerFormProvider.name
                          );
                          // TODO: peticion http
                        }, text: "Crear Cuenta"),
                    const SizedBox(height: 20),
                    LinkText(
                        text: 'Ya tengo una cuenta',
                        onPressed: () {
                             Navigator.pushNamed(context, Flurorouter.loginRoute);
                        })
                  ],
                ),
              ),
            ),
          ));
      })
    );
  }

  
}
