import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_cartera.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cartera.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:shoes_shop/shared/util/const.dart';
import 'package:sqflite/sqflite.dart';

class CarteraRepository implements ICartera {
  @override
  Future<bool> createCartera(cartera) {
    // TODO: implement createCartera
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteCartera(cartera) {
    // TODO: implement deleteCartera
    throw UnimplementedError();
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
            columns: ['c.valor', 'cl.nombre', 'cl.apellido', 'cl.id']);

        data = response.map((e) => Cartera.fromJson(e)).toList();
      }
    } catch (e) {
      Get.printError(info: "Error al yupdate clietne ----> $e");
      return data;
    }

    return data;
  }

  @override
  Future<bool> updateCartera(cartera) {
    // TODO: implement updateCartera
    throw UnimplementedError();
  }
}
