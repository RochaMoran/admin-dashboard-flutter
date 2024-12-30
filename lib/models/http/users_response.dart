// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromJson(jsonString);

import 'dart:convert';

import 'package:admin_dashboard/models/user.dart';

UsersResponse usersResponseFromJson(String str) => UsersResponse.fromJson(json.decode(str));

String usersResponseToJson(UsersResponse data) => json.encode(data.toJson());

class UsersResponse {
    int total;
    List<User> usuarios;

    UsersResponse({
        required this.total,
        required this.usuarios,
    });

    UsersResponse copyWith({
        int? total,
        List<User>? usuarios,
    }) => 
        UsersResponse(
            total: total ?? this.total,
            usuarios: usuarios ?? this.usuarios,
        );

    factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
        total: json["total"],
        usuarios: List<User>.from(json["usuarios"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
    };

    factory UsersResponse.fromMap(Map<String, dynamic> json) => UsersResponse(
        total: json["total"],
        usuarios: List<User>.from(json["usuarios"].map((x) => User.fromJson(x))),
    );
}


enum Rol {
    USER_ROLE
}

final rolValues = EnumValues({
    "USER_ROLE": Rol.USER_ROLE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
