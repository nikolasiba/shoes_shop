import 'dart:developer';

import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_empleado.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/empleado.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:shoes_shop/shared/util/const.dart';
import 'package:sqflite/sqflite.dart';

class EmpleadoRepository implements IEmpleado {
  @override
  Future<List<Empleado>> getEmpleados() async {
    Database? db;
    List<Empleado> empleado = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List result = await db.query(
            'empleado e '
            'inner join cargo  c '
            'on c.id = e.id_cargo '
            'inner join  ciudad ci  '
            'on ci.id = e.id_ciudad '
            'inner join Departamento d '
            'on d.id = ci.id_departamento ',
            columns: [
              'e.id',
              'e.nombre',
              'e.s_nombre',
              'e.apellido',
              'e.s_apellido',
              'e.telefono',
              'e.email',
              'c.descripcion cargo',
              'e.direccion',
              'ci.nombre ciudad',
              'd.nombre departamento',
              'e.id_almacen'
            ]);

        if (result.isNotEmpty) {
          empleado = result.map((e) => Empleado.fromJson(e)).toList();
        }

        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al cargar empleados ----> $e");
      return empleado;
    }

    return empleado;
  }

  @override
  Future<bool> deleteEmpleado(int id) async {
    Database? db;

    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        int result =
            await db.delete('Empleado', where: 'id = ?', whereArgs: [id]);

        return result > 0;
      }
    } catch (e) {
      Get.printError(info: "Error al eliminar empleados ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<List<GeneralModel>> getCargos() async {
    Database? db;
    List<GeneralModel> cargo = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response = await db.query('Cargo');

        if (response.isNotEmpty) {
          cargo = response.map((e) => GeneralModel.fromJson(e)).toList();
        }

        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Erro getCargos ----> $e");
      return cargo;
    }

    return cargo;
  }

  @override
  Future<List<GeneralModel>> getCiudades() async {
    Database? db;
    List<GeneralModel> ciudades = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response =
            await db.query('Ciudad', columns: ['id', 'nombre descripcion']);

        if (response.isNotEmpty) {
          ciudades = response.map((e) => GeneralModel.fromJson(e)).toList();
        }

        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al get ciudades ----> $e");
      return ciudades;
    }

    return ciudades;
  }

  @override
  Future<List<GeneralModel>> getDepartamentos() async {
    Database? db;
    List<GeneralModel> departamentos = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response = await db
            .query('Departamento', columns: ['id', 'nombre descripcion']);

        if (response.isNotEmpty) {
          departamentos =
              response.map((e) => GeneralModel.fromJson(e)).toList();
        }

        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al get ciudades ----> $e");
      return departamentos;
    }

    return departamentos;
  }

  @override
  Future<bool> crearEmpleado(Empleado empleado) async {
    Database? db;

    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        await db.insert(
            'Cuenta', {"usuario": empleado.email, "contrasena": empleado.id});
        int response = await db.insert('Empleado', empleado.toJson());

        return response > 0;

        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al insertar empleado ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<List<GeneralModel>> getAlmacen() async {
    Database? db;
    List<GeneralModel> almacenes = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response =
            await db.query('Almacen', columns: ['id', 'nombre descripcion']);

        if (response.isNotEmpty) {
          almacenes = response.map((e) => GeneralModel.fromJson(e)).toList();
        }

        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al get ciudades ----> $e");
      return almacenes;
    }

    return almacenes;
  }

  @override
  Future<bool> actualizarEmpleado(Empleado empleado) async {
    log(empleado.toJson().toString());
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        int response = await db.update('Empleado', empleado.toJson(),
            where: 'id = ?', whereArgs: [empleado.id]);

        return response > 0;
        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al update empleado ----> $e");
      return false;
    }

    return false;
  }
}
