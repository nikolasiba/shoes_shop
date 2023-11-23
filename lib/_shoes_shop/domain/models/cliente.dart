// To parse this JSON data, do
//
//     final cliente = clienteFromJson(jsonString);

import 'dart:convert';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
  int? id;
  String? nombre;
  String? nombre2;
  String? apellido;
  String? apellido2;
  String? telefono;
  String? email;
  String? direccion;
  String? ciudad;
  String? departamento;

  Cliente({
    this.id,
    this.nombre,
    this.nombre2,
    this.apellido,
    this.apellido2,
    this.telefono,
    this.email,
    this.direccion,
    this.ciudad,
    this.departamento,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        nombre: json["nombre"],
        nombre2: json["nombre_2"],
        apellido: json["apellido"],
        apellido2: json["apellido_2"],
        telefono: json["telefono"],
        email: json["email"],
        direccion: json["direccion"],
        ciudad: json["ciudad"],
        departamento: json["departamento"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "nombre_2": nombre2,
        "apellido": apellido,
        "apellido_2": apellido2,
        "telefono": telefono,
        "email": email,
        "direccion": direccion,
        "id_ciudad": ciudad,
      };
}
