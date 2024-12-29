// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:admin_dashboard/models/category.dart';

CategoriesResponse categoriesResponseFromJson(String str) => CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) => json.encode(data.toJson());

class CategoriesResponse {
    int total;
    List<Categoria> categorias;

    CategoriesResponse({
        required this.total,
        required this.categorias,
    });

    CategoriesResponse copyWith({
        int? total,
        List<Categoria>? categorias,
    }) => 
        CategoriesResponse(
            total: total ?? this.total,
            categorias: categorias ?? this.categorias,
        );

    factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
        total: json["total"],
        categorias: List<Categoria>.from(json["categorias"].map((x) => Categoria.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "categorias": List<dynamic>.from(categorias.map((x) => x.toJson())),
    };

    factory CategoriesResponse.fromMap(Map<String, dynamic> json) => CategoriesResponse(
        total: json["total"],
        categorias: List<Categoria>.from(json["categorias"].map((x) => Categoria.fromJson(x))),
    );
}
