import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_almacenes.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/almacen.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';

class AlmacenService {
  final IAlmacenes iAlmacenes;

  AlmacenService(this.iAlmacenes);

  Future<List<Almacen>> getAlmacenes() async {
    return await iAlmacenes.getAlmacenes();
  }

  Future<bool> createAlmacen(dynamic almacen) async {
    return await iAlmacenes.createAlmacen(almacen);
  }

  Future<bool> updateAlmacen(dynamic almacen) async {
    return await iAlmacenes.updateAlmacen(almacen);
  }

  Future<bool> deleteAlmacen(int id) async {
    return await iAlmacenes.deleteAlmacen(id);
  }

  Future<List<GeneralModel>> getCiudades() {
    return iAlmacenes.getCiudades();
  }
}
