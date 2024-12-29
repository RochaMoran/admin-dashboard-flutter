import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categories;
  final BuildContext context;

  CategoriesDTS(this.categories, this.context);

  @override
  DataRow? getRow(int index) {
    final category = categories[index];

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
        DataCell(Text(category.id)),
        DataCell(Text(category.nombre)),
        DataCell(Text(category.usuario.nombre)),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.blue),
                onPressed: () {
                  print('Editando ${category.nombre}');
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () {
                  final dialog = AlertDialog(
                    title: const Text('¿Está seguro de eliminar?'),
                    content: Text('Está a punto de eliminar ${category.nombre}'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          print('Eliminando ${category.nombre}');
                          Navigator.of(context).pop();
                        },
                        child: const Text('Eliminar'),
                      ),
                    ],
                  );

                  showDialog(context: context, builder: (_) => dialog);
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
  int get rowCount => categories.length;

  @override
  int get selectedRowCount => 0;

}