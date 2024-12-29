import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
   List<Categoria> _categories = [];

  List<Categoria> get categories => _categories;

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(resp);

    _categories = categoriesResponse.categorias;
    
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {
      'nombre': name
    };

    try {
      final json = await CafeApi.httpPost('/categorias', data);
      final newCategory = Categoria.fromMap(json);
      _categories.add(newCategory);
      notifyListeners();
      return '';
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}