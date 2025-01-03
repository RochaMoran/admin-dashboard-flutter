import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildBoxDecoration(),  
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(hint: 'Buscar', icon: Icons.search),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.grey.withOpacity(0.1),
  );
}