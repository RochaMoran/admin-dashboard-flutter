class User {
    String rol;
    bool estado;
    bool google;
    String nombre;
    String correo;
    String uid;
    String? img;

    User({
        required this.rol,
        required this.estado,
        required this.google,
        required this.nombre,
        required this.correo,
        required this.uid,
        this.img,
    });

    User copyWith({
        String? rol,
        bool? estado,
        bool? google,
        String? nombre,
        String? correo,
        String? uid,
        String? img,
    }) => 
        User(
            rol: rol ?? this.rol,
            estado: estado ?? this.estado,
            google: google ?? this.google,
            nombre: nombre ?? this.nombre,
            correo: correo ?? this.correo,
            uid: uid ?? this.uid,
            img: img ?? this.img,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        nombre: json["nombre"],
        correo: json["correo"],
        uid: json["uid"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "rol": rol,
        "estado": estado,
        "google": google,
        "nombre": nombre,
        "correo": correo,
        "uid": uid,
        "img": img,
    };

    factory User.fromMap(Map<String, dynamic> json) => User(
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        nombre: json["nombre"],
        correo: json["correo"],
        uid: json["uid"],
        img: json["img"],
    );

  @override
  String toString() {
    return 'User(id: $uid, nombre: $nombre)';
  }
}
