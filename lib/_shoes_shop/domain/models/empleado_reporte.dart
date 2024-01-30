// To parse this JSON data, do
//
//     final empleadoReporte = empleadoReporteFromJson(jsonString);

import 'dart:convert';

EmpleadoReporte empleadoReporteFromJson(String str) =>
    EmpleadoReporte.fromJson(json.decode(str));

String empleadoReporteToJson(EmpleadoReporte data) =>
    json.encode(data.toJson());

class EmpleadoReporte {
  int? id;
  String? nombre;
  String? sNombre;
  String? apellido;
  String? sApellido;
  String? telefono;
  String? email;
  String? direccion;
  String? cargo;
  String? departamento;
  String? almacen;

  EmpleadoReporte({
    this.id,
    this.nombre,
    this.sNombre,
    this.apellido,
    this.sApellido,
    this.telefono,
    this.email,
    this.direccion,
    this.cargo,
    this.departamento,
    this.almacen,
  });

  factory EmpleadoReporte.fromJson(Map<String, dynamic> json) =>
      EmpleadoReporte(
        id: json["id"],
        nombre: json["nombre"],
        sNombre: json["s_nombre"],
        apellido: json["apellido"],
        sApellido: json["s_apellido"],
        telefono: json["telefono"],
        email: json["email"],
        direccion: json["direccion"],
        cargo: json["cargo"],
        departamento: json["departamento"],
        almacen: json["almacen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "s_nombre": sNombre,
        "apellido": apellido,
        "s_apellido": sApellido,
        "telefono": telefono,
        "email": email,
        "direccion": direccion,
        "cargo": cargo,
        "departamento": departamento,
        "almacen": almacen,
      };
}
