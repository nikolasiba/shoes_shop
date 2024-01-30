// To parse this JSON data, do
//
//     final cuentaReporte = cuentaReporteFromJson(jsonString);

import 'dart:convert';

CuentaReporte cuentaReporteFromJson(String str) =>
    CuentaReporte.fromJson(json.decode(str));

String cuentaReporteToJson(CuentaReporte data) => json.encode(data.toJson());

class CuentaReporte {
  int? id;
  String? usuario;
  String? contrasena;

  CuentaReporte({
    this.id,
    this.usuario,
    this.contrasena,
  });

  factory CuentaReporte.fromJson(Map<String, dynamic> json) => CuentaReporte(
        id: json["id"],
        usuario: json["usuario"],
        contrasena: json["contrasena"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "contrasena": contrasena,
      };
}
