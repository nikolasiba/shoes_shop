import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_login.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/empleado.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:shoes_shop/shared/util/const.dart';
import 'package:sqflite/sqflite.dart';

class LoginRepository implements ILogin {
  @override
  Future<Empleado> login(
      {required String user, required String password}) async {
    Database? db;
    Empleado response = Empleado();
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB(Const.dbName);

      if (db != null) {
        List result = await db.query(
            'Cuenta c '
            'inner join Empleado e '
            'on e.id_cuenta = c.id ',
            columns: ['e.*'],
            where: 'c.usuario =? and c.contrasena =?',
            whereArgs: [user, password]);

        log(jsonEncode(result.first));
        response = Empleado.fromJson(result.first);
      }
    } catch (e) {
      Get.printError(info: "Error al loguearse ----> $e");
      return response;
    }

    return response;
  }
}
