import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  final String uid;
  const UserView({super.key, required this.uid});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  User? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid).then((user) {
      if(user == null) {
        NavigationService.replaceTo('/dashboard/users');
        return;
      }

      userFormProvider.user = user;

      setState(() {
        this.user = user;
      });
    });
  }

  @override
  void dispose() {
    user = null;
    Provider.of<UserFormProvider>(context, listen: false).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text("User View", style: CustomLabels.h1),
        const SizedBox(height: 10),
        if (user == null)
          WhiteCard(
              child: Container(
            alignment: Alignment.center,
            // height: 400,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ))
        else
          _UserViewBody()
      ],
    );
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Table(
      columnWidths: const {0: FixedColumnWidth(250)},
      children: const [
        TableRow(children: [_AvatarContainer(), _UserViewForm()])
      ],
    ));
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      title: 'Información del usuario ${user.correo}',
      child: Form(
        key: userFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              initialValue: user.nombre,
              onChanged: (value) =>
                  userFormProvider.copyUserWith(nombre: value),
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Nombre usuario',
                  label: 'Nombre',
                  icon: Icons.supervised_user_circle_outlined),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Ingrese un nombre';
                if (value.length < 2)
                  return 'El nombre debe contener al menos 2 caracteres';
                return null;
              },
            ),
            TextFormField(
              initialValue: user.correo,
              onChanged: (value) =>
                  userFormProvider.copyUserWith(correo: value),
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Correo de usuario',
                  label: 'Correo',
                  icon: Icons.email_outlined),
              validator: (value) {
                if (EmailValidator.validate(value!)) return null;

                return 'Ingrese un correo valido';
              },
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 150),
              child: ElevatedButton(
                  onPressed: () async {
                    final saved = await userFormProvider.updateUser();

                    if (saved) {
                      NotificationsService.showSnackbar('Usuario actualizado');
                      Provider.of<UsersProvider>(context, listen: false)
                          .refreshUser(user);
                    } else {
                      NotificationsService.showSnackbarError(
                          'No se pudo guardar el usuario');
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo)),
                  child: const Row(
                    children: [
                      Icon(Icons.save_outlined, color: Colors.white),
                      Text('Guardar',
                          style: TextStyle(fontSize: 18, color: Colors.white))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      width: 250,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile', style: CustomLabels.h2),
            const SizedBox(height: 20),
            SizedBox(
                width: 150,
                height: 160,
                child: Stack(
                  children: [
                    const ClipOval(
                      child: Image(image: AssetImage('no-image.jpg')),
                    ),
                    Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: Colors.white, width: 5)),
                            child: FloatingActionButton(
                              backgroundColor: Colors.indigo,
                              elevation: 0,
                              child: const Icon(Icons.camera_alt_outlined,
                                  size: 20, color: Colors.white),
                              onPressed: () {},
                            )))
                  ],
                )),
            const SizedBox(height: 20),
            Text(user.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
