import 'dart:convert';

import 'package:admin_dashboard/models/user.dart';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
    User usuario;
    String token;

    AuthResponse({
        required this.usuario,
        required this.token,
    });

    AuthResponse copyWith({
        User? usuario,
        String? token,
    }) => 
        AuthResponse(
            usuario: usuario ?? this.usuario,
            token: token ?? this.token,
        );

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        usuario: User.fromJson(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
        "token": token,
    };

    factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        usuario: User.fromJson(json["usuario"]),
        token: json["token"],
    );
}

