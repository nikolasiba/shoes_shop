import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_reportes.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cliente.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cuenta_reporte.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/empleado_reporte.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/factura.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/producto_reporte.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:shoes_shop/shared/util/const.dart';
import 'package:sqflite/sqflite.dart';

class ReportesRepository implements IReportes {
  @override
  Future<List> reporteClientes() async {
    Database? db;
    List<Cliente> clientes = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response = await db.query(
            'Cliente c '
            'inner join ciudad ci '
            'on ci.id = c.id_ciudad '
            'inner join Departamento d '
            'on d.id = ci.id_departamento ',
            columns: [
              'c.id',
              'c.nombre',
              'c.nombre_2',
              'c.apellido',
              'c. apellido_2',
              'c.telefono',
              'c.email',
              'c.direccion',
              'ci.nombre ciudad',
              'd.nombre departamento',
            ]);
        log(jsonEncode(response.first));
        clientes = response.map((e) => Cliente.fromJson(e)).toList();
        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al get almacenes ----> $e");
      return [];
    }

    return clientes;
  }

  @override
  Future<List> reporteEmpleados() async {
    Database? db;
    List data = [];

    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response = await db.query(
            ' Empleado e '
            'inner join Ciudad c '
            'on ca.id = e.id_cargo '
            'inner join Cargo ca '
            'on e.id_ciudad = c.id '
            'inner join Departamento d '
            'on d.id = c.id_departamento '
            'inner join Almacen a '
            'on a.id = e.id_almacen ',
            columns: [
              'e.id',
              'e.nombre',
              'e.s_nombre',
              'e.apellido',
              'e.s_apellido',
              'e.telefono',
              'e.email',
              'e.direccion',
              'ca.descripcion cargo',
              'd.nombre departamento',
              'a.nombre almacen'
            ],
            orderBy: 'a.id desc');
        if (response.isNotEmpty) {
          log(jsonEncode(response.first));
          data = response.map((e) => EmpleadoReporte.fromJson(e)).toList();
        }
      }
    } catch (e) {
      Get.printError(info: "Error al reporte empleado clietne ----> $e");
      return data;
    }
    return data;
  }

  @override
  Future<List> reporteProductos() async {
    Database? db;
    List data = [];

    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response = await db.query(
          'producto p '
          'inner join Detalle d '
          'on d.id_producto = p.id '
          'inner join Inventario i '
          'on i.id = d.id_inventario '
          'inner join Categoria c '
          'on c.id = d.id_categoria',
          columns: [
            'p.id',
            ' p.nombre',
            '  d.precio',
            ' i.cantidad',
            'c.descripcion categoria'
          ],
        );
        if (response.isNotEmpty) {
          log(jsonEncode(response.first));
          data = response.map((e) => ProductoReporte.fromJson(e)).toList();
        }
      }
    } catch (e) {
      Get.printError(info: "Error al reporte productos  ----> $e");
      return data;
    }
    return data;
  }

  @override
  Future<List> reportUsuariosRegistrados() async {
    Database? db;
    List data = [];

    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response = await db.query(
          'Cuenta',
          columns: [
            'id',
            'usuario',
            'contrasena',
          ],
        );
        if (response.isNotEmpty) {
          log(jsonEncode(response.first));
          data = response.map((e) => CuentaReporte.fromJson(e)).toList();
        }
      }
    } catch (e) {
      Get.printError(info: "Error al reporte cuentas  ----> $e");
      return data;
    }
    return data;
  }

  @override
  Future<List> reporteFacturas() async {
    Database? db;
    List data = [];

    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response = await db.query(
          'factura f '
          'inner join empleado e '
          'on e.id = f.id_empleado '
          'inner join cliente c '
          'on c.id = f.id_cliente',
          columns: [
            'f.id ',
            'f.total',
            'e.nombre empleado',
            'c.nombre cliente',
          ],
        );
        if (response.isNotEmpty) {
          log(jsonEncode(response.first));
          data = response.map((e) => Factura.fromJson(e)).toList();
        }
      }
    } catch (e) {
      Get.printError(info: "Error al reporte cuentas  ----> $e");
      return data;
    }
    return data;
  }
}
