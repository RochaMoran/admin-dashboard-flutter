
class Categoria {
    String id;
    String nombre;
    UsuarioCategory usuario;

    Categoria({
        required this.id,
        required this.nombre,
        required this.usuario,
    });

    Categoria copyWith({
        String? id,
        String? nombre,
        UsuarioCategory? usuario,
    }) => 
        Categoria(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
            usuario: usuario ?? this.usuario,
        );

    factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: UsuarioCategory.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toJson(),
    };

    factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: UsuarioCategory.fromJson(json["usuario"]),
    );

  @override
  String toString() {
    return 'Categoria(id: $id, nombre: $nombre)';
  }
}

class UsuarioCategory {
    String id;
    String nombre;

    UsuarioCategory({
        required this.id,
        required this.nombre,
    });

    UsuarioCategory copyWith({
        String? id,
        String? nombre,
    }) => 
        UsuarioCategory(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
        );

    factory UsuarioCategory.fromJson(Map<String, dynamic> json) => UsuarioCategory(
        id: json["_id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
    };
}
