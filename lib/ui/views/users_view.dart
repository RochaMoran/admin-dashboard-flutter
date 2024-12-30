import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDTS(usersProvider.users, context);

    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text("Users View", style: CustomLabels.h1),
        const SizedBox(height: 10),
        PaginatedDataTable(
          columns:  [
            const DataColumn(label: Text('Avatar')),
            DataColumn(label: const Text('Nombre'), onSort: (colIndex, _) {
              usersProvider.sort<String>((user) => user.nombre);
            }),
            DataColumn(label: const Text('Email'), onSort: (colIndex, _) {
              usersProvider.sort<String>((user) => user.correo);
            }),
            const DataColumn(label: Text('UID')),
            const DataColumn(label: Text('Acciones')),
          ], 
          source: usersDataSource
        )
      ],
    );
  }
}