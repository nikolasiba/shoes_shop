// To parse this JSON data, do
//
//     final productoReporte = productoReporteFromJson(jsonString);

import 'dart:convert';

ProductoReporte productoReporteFromJson(String str) =>
    ProductoReporte.fromJson(json.decode(str));

String productoReporteToJson(ProductoReporte data) =>
    json.encode(data.toJson());

class ProductoReporte {
  int? id;
  String? nombre;
  double? precio;
  int? cantidad;
  String? categoria;

  ProductoReporte({
    this.id,
    this.nombre,
    this.precio,
    this.cantidad,
    this.categoria,
  });

  factory ProductoReporte.fromJson(Map<String, dynamic> json) =>
      ProductoReporte(
        id: json["id"],
        nombre: json["nombre"],
        precio: json["precio"]?.toDouble(),
        cantidad: json["cantidad"],
        categoria: json["categoria"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "precio": precio,
        "cantidad": cantidad,
        "categoria": categoria,
      };
}
