import 'package:shoes_shop/_shoes_shop/domain/models/almacen.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';

abstract class IAlmacenes {
  Future<List<Almacen>> getAlmacenes();
  Future<bool> createAlmacen(dynamic almacen);
  Future<bool> updateAlmacen(dynamic almacen);
  Future<bool> deleteAlmacen(int id);

  Future<List<GeneralModel>> getCiudades();
}
