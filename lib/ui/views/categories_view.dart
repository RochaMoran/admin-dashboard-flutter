import 'package:admin_dashboard/ui/cards/white_card.dart';
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
        const  WhiteCard(title: 'Categorias titulo', child: Text('Hola mundo')),
      ],
    );
  }
}
