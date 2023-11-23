// To parse this JSON data, do
//
//     final empleado = empleadoFromJson(jsonString);

import 'dart:convert';

Login empleadoFromJson(String str) => Login.fromJson(json.decode(str));

String empleadoToJson(Login data) => json.encode(data.toJson());

class Login {
  int? id;
  int? idAlmacen;
  String? nombre;
  String? sNombre;
  String? apellido;
  String? sApellido;
  String? telefono;
  String? email;
  String? direccion;
  int? idCuenta;
  int? idCargo;

  Login({
    this.id,
    this.idAlmacen,
    this.nombre,
    this.sNombre,
    this.apellido,
    this.sApellido,
    this.telefono,
    this.email,
    this.direccion,
    this.idCuenta,
    this.idCargo,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["id"],
        idAlmacen: json["id_almacen"],
        nombre: json["nombre"],
        sNombre: json["s_nombre"],
        apellido: json["apellido"],
        sApellido: json["s_apellido"],
        telefono: json["telefono"],
        email: json["email"],
        direccion: json["direccion"],
        idCuenta: json["id_cuenta"],
        idCargo: json["id_cargo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_almacen": idAlmacen,
        "nombre": nombre,
        "s_nombre": sNombre,
        "apellido": apellido,
        "s_apellido": sApellido,
        "telefono": telefono,
        "email": email,
        "direccion": direccion,
        "id_cuenta": idCuenta,
        "id_cargo": idCargo,
      };
}
