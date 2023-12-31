// To parse this JSON data, do
//
//     final empleado = empleadoFromJson(jsonString);

import 'dart:convert';

Empleado empleadoFromJson(String str) => Empleado.fromJson(json.decode(str));

String empleadoToJson(Empleado data) => json.encode(data.toJson());

class Empleado {
  int? id;
  String? nombre;
  String? sNombre;
  String? apellido;
  String? sApellido;
  String? telefono;
  String? email;
  String? cargo;
  String? direccion;
  String? ciudad;
  String? departamento;
  int? idAlmacen;

  Empleado({
    this.id,
    this.nombre,
    this.sNombre,
    this.apellido,
    this.sApellido,
    this.telefono,
    this.email,
    this.cargo,
    this.direccion,
    this.ciudad,
    this.departamento,
    this.idAlmacen,
  });

  factory Empleado.fromJson(Map<String, dynamic> json) => Empleado(
        id: json["id"],
        nombre: json["nombre"],
        sNombre: json["s_nombre"],
        apellido: json["apellido"],
        sApellido: json["s_apellido"],
        telefono: json["telefono"],
        email: json["email"],
        cargo: json["cargo"],
        direccion: json["direccion"],
        ciudad: json["ciudad"],
        departamento: json["departamento"],
        idAlmacen: json["id_almacen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "s_nombre": sNombre,
        "apellido": apellido,
        "s_apellido": sApellido,
        "telefono": telefono,
        "email": email,
        "id_cargo": int.parse(cargo!),
        "direccion": direccion!,
        "id_ciudad": int.parse(ciudad!),
        "id_cuenta": id,
        "id_almacen": idAlmacen,

        // "id_departamento": int.parse(departamento!),
      };
}
