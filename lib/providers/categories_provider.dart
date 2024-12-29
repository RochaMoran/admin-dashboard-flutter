import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> _categories = [];

  List<Categoria> get categories => _categories;

  set categories(List<Categoria> categories) {
    _categories = categories;
    notifyListeners();
  }

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
      throw e.toString();
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {
      'nombre': name
    };

    try {
      final path = '/categorias/$id';
      await CafeApi.httpPut(path, data);
      _categories = _categories.map((category) {
        if (category.id == id) {
          category.nombre = name;
        }
        return category;
      }).toList();
      notifyListeners();
      return '';
    } catch (e) {
      throw e.toString();
    }
  }

  Future deleteCategory(String id) async {
    try {
      final path = '/categorias/$id';
      await CafeApi.httpDelete(path);
      _categories.removeWhere((category) => category.id == id);
      notifyListeners();
      return '';
    } catch (e) {
      throw e.toString();
    }
  }
}