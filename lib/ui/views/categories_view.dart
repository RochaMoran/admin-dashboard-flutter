import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text("Categorias", style: CustomLabels.h1),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Fondo de la tabla
            borderRadius: BorderRadius.circular(10),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              // Fondo del header de las columnas y paginación
              cardColor: Colors.white,
              // Estilo de los textos en la tabla
              dataTableTheme: DataTableThemeData(
                headingRowColor:
                    MaterialStateProperty.resolveWith((states) => Colors.white), // Fondo de las columnas
                headingTextStyle: const TextStyle(
                  color: Colors.black, // Color del texto en columnas
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            child: PaginatedDataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Categoria')),
                DataColumn(label: Text('Creado por')),
                DataColumn(label: Text('Acciones')),
              ],
              source: CategoriesDTS(),
            ),
          ),
        ),
      ],
    );
  }
}
