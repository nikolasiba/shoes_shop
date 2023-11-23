import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_almacenes.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/almacen.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:shoes_shop/shared/util/const.dart';
import 'package:sqflite/sqflite.dart';

class AlmacenRepository implements IAlmacenes {
  @override
  Future<bool> createAlmacen(almacen) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        int response = await db.insert(
          'Almacen',
          almacen.toJson(),
        );

        return response > 0;
        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al get almacenes ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<bool> deleteAlmacen(int id) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        int response =
            await db.delete('Almacen', where: 'id = ?', whereArgs: [id]);

        return response > 0;
        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al get almacenes ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<List<Almacen>> getAlmacenes() async {
    Database? db;
    List<Almacen> almacenes = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response = await db.query(
            'Almacen a '
            'inner join Ciudad c '
            'on c.id = a.id_ciudad '
            'inner join Departamento d '
            'on d.id = c.id_departamento ',
            columns: [
              'a.id',
              'a.nombre',
              'a.direccion',
              'c.nombre as ciudad',
              'd.nombre as departamento',
            ]);

        if (response.isNotEmpty) {
          almacenes = response.map((e) => Almacen.fromJson(e)).toList();
        }

        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al get almacenes ----> $e");
      return almacenes;
    }

    return almacenes;
  }

  @override
  Future<bool> updateAlmacen(almacen) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        int response = await db.update(
          'Almacen ',
          almacen.toJson(),
          where: 'id = ?',
          whereArgs: [almacen.id],
        );
        return response > 0;

        // response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al get almacenes ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<List<GeneralModel>> getCiudades() async {
    Database? db;
    List<GeneralModel> response1 = [];

    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response =
            await db.query('Ciudad', columns: ['id', 'nombre as descripcion']);

        response1 = response.map((e) => GeneralModel.fromJson(e)).toList();
      }
    } catch (e) {
      Get.printError(info: "Error al get almacenes ----> $e");
      return [];
    }

    return response1;
  }
}
