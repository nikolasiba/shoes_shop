// To parse this JSON data, do
//
//     final almacen = almacenFromJson(jsonString);

import 'dart:convert';

Almacen almacenFromJson(String str) => Almacen.fromJson(json.decode(str));

String almacenToJson(Almacen data) => json.encode(data.toJson());

class Almacen {
  int? id;
  String? nombre;
  String? direccion;
  String? ciudad;
  String? departamento;

  Almacen({
    this.id,
    this.nombre,
    this.direccion,
    this.ciudad,
    this.departamento,
  });

  factory Almacen.fromJson(Map<String, dynamic> json) => Almacen(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        ciudad: json["ciudad"],
        departamento: json["departamento"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "ciudad": ciudad,
        "departamento": departamento,
      };
}
