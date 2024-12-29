import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categories;

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
              cardColor: Colors.white,
              // Estilo de los textos en la tabla
              dataTableTheme: DataTableThemeData(
                headingRowColor:
                    MaterialStateProperty.all(Colors.white), // Fondo de las columnas
                headingTextStyle: const TextStyle(
                  color: Colors.black, // Color del texto en columnas
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            child: PaginatedDataTable(
              headingRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Categoria')),
                DataColumn(label: Text('Creado por')),
                DataColumn(label: Text('Acciones')),
              ],
              source: CategoriesDTS(categorias, context),
              header: const Text(
                  'Categorias'
              ),
              onRowsPerPageChanged: (value) {
                setState(() {
                  _rowsPerPage = value ?? 10;
                });
              },
              rowsPerPage: _rowsPerPage,
              actions: [
                CustomIconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const Dialog(
                        insetPadding: EdgeInsets.zero, // Elimina los márgenes
                        child:  CategoryModal(),
                      ),
                  );
                  }, 
                  text: 'Crear',
                  icon: Icons.add_outlined,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
