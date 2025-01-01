import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

class UsersDTS extends DataTableSource {
  final List<User> users;
  final BuildContext context;

  UsersDTS(this.users, this.context);

   @override
  DataRow? getRow(int index) {
    final User user = users[index];
    const image = Image(image: AssetImage('no-image.jpg'), width: 35, height: 35);

    return DataRow.byIndex(
      index: index,
     color: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return index % 2 == 0
              ? Colors.blue[300]?.withOpacity(0.5) // Fondo para filas pares
              : Colors.white; // Fondo para filas impares
        },
      ),
      cells: [
        const DataCell(
          ClipOval(
            child: image,
          )
        ),
        DataCell(Text(user.nombre)),
        DataCell(Text(user.correo)),
        DataCell(Text(user.uid)),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.blue),
                onPressed: () {
                  NavigationService.replaceTo('/dashboard/users/${user.uid}');
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () {
                
                },
              ),
            ],
          ),
        ),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}