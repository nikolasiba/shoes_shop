import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_cartera.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cartera.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:shoes_shop/shared/util/const.dart';
import 'package:sqflite/sqflite.dart';

class CarteraRepository implements ICartera {
  @override
  Future<bool> createCartera(cartera) async {
    Database? db;

    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        int response = await db.insert('Cartera', cartera.toJson());
        return response > 0;
      }
    } catch (e) {
      Get.printError(info: "Error al insertar clietne ----> $e");
      return false;
    }
    return false;
  }

  @override
  Future<bool> deleteCartera(cartera) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        int response =
            await db.delete('cartera', where: 'id = ?', whereArgs: [cartera]);
        return response > 0;
      }
    } catch (e) {
      Get.printError(info: "Error al delete  ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<List<Cartera>> getCartera() async {
    Database? db;
    List<Cartera> data = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response = await db.query(
            'cartera c '
            'inner join Cliente cl '
            'on cl.id = c.id_cliente ',
            columns: [
              'c.valor',
              'cl.nombre',
              'cl.apellido',
              'cl.id',
              'c.id id_cartera'
            ]);

        data = response.map((e) => Cartera.fromJson(e)).toList();
      }
    } catch (e) {
      Get.printError(info: "Error al yupdate clietne ----> $e");
      return data;
    }

    return data;
  }

  @override
  Future<bool> updateCartera(cartera) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        int response = await db.update('cartera', cartera.toJson(),
            where: 'id = ?', whereArgs: [cartera.id]);
        return response > 0;
      }
    } catch (e) {
      Get.printError(info: "Error al update clietne ----> $e");
      return false;
    }
    return false;
  }

  @override
  Future<List<GeneralModel>> getClientes() async {
    Database? db;
    List<GeneralModel> data = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List response = await db.query(
          ' Cliente c '
          'LEFT JOIN Cartera ca '
          'ON c.id = ca.id_cliente',
          where: 'ca.id_cliente IS NULL',
          columns: [
            'COALESCE(c.nombre, "") || " " || COALESCE(c.apellido, "") AS descripcion',
            'c.id'
          ],
        );

        data = response.map((e) => GeneralModel.fromJson(e)).toList();
      }
    } catch (e) {
      Get.printError(
          info: "Error al traer clienetes sin cartera clietne ----> $e");
      return data;
    }
    return data;
  }
}
