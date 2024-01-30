// To parse this JSON data, do
//
//     final factura = facturaFromJson(jsonString);

import 'dart:convert';

Factura facturaFromJson(String str) => Factura.fromJson(json.decode(str));

String facturaToJson(Factura data) => json.encode(data.toJson());

class Factura {
  int? id;
  int? total;
  String? empleado;
  String? cliente;

  Factura({
    this.id,
    this.total,
    this.empleado,
    this.cliente,
  });

  factory Factura.fromJson(Map<String, dynamic> json) => Factura(
        id: json["id"],
        total: json["total"],
        empleado: json["empleado"],
        cliente: json["cliente"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total": total,
        "empleado": empleado,
        "cliente": cliente,
      };
}
