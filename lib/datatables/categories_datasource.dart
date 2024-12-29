import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
      index: index,
     color: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          // Cambiar el color de las filas (pares e impares)
          return index % 2 == 0
              ? Colors.blue[300]?.withOpacity(0.5) // Fondo para filas pares
              : Colors.white; // Fondo para filas impares
        },
      ),
      cells: [
        DataCell(Text('Cell #1 index $index')),
        DataCell(Text('Cell #2 index $index')),
        DataCell(Text('Cell #3 index $index')),
        DataCell(Text('Cell #4 index $index')),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 1000;

  @override
  int get selectedRowCount => 0;

}