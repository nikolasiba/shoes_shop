// To parse this JSON data, do
//
//     final cartera = carteraFromJson(jsonString);

import 'dart:convert';

Cartera carteraFromJson(String str) => Cartera.fromJson(json.decode(str));

String carteraToJson(Cartera data) => json.encode(data.toJson());

class Cartera {
  int? valor;
  String? nombre;
  String? apellido;
  int? id;

  Cartera({
    this.valor,
    this.nombre,
    this.apellido,
    this.id,
  });

  factory Cartera.fromJson(Map<String, dynamic> json) => Cartera(
        valor: json["valor"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "valor": valor,
        "nombre": nombre,
        "apellido": apellido,
        "id": id,
      };
}
