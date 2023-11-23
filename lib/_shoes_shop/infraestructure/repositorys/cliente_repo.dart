import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_cliente.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cliente.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:shoes_shop/shared/util/const.dart';
import 'package:sqflite/sqflite.dart';

class ClientesRepository implements ICliente {
  @override
  Future<bool> actualizarCliente(cliente) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        int response = await db.update('Cliente', cliente.toJson(),
            where: 'id = ?', whereArgs: [cliente.id]);
        return response > 0;
        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al yupdate clietne ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<bool> crearClietne(cliente) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        int response = await db.insert('Cliente', cliente.toJson());
        return response > 0;
        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al insert clientes ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<bool> eliminarCliente(id) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        int response = await db
            .delete('Cliente', where: 'id = ?', whereArgs: [id]);
        return response > 0;
        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al yupdate clietne ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<List<Cliente>> obtenerClientes() async {
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
  Future<List<GeneralModel>> obtenerCiudades() async {
    Database? db;
    List<GeneralModel> ciudades = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response = await db.query('Ciudad', columns: [
          'id',
          'nombre descripcion',
        ]);
        log(jsonEncode(response.first));
        ciudades = response.map((e) => GeneralModel.fromJson(e)).toList();
        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al get ciudades ----> $e");
      return [];
    }

    return ciudades;
  }
}
